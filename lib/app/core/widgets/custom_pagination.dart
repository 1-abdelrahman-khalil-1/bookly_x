import 'package:bookly_x_client/app/core/api_helper/exceptions.dart';
import 'package:bookly_x_client/app/core/screens_not_related/no_internet_screen.dart';
import 'package:bookly_x_client/app/core/screens_not_related/server_error_screen.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

import 'custom_sized_box.dart';

bool _isOfflinePaginationError(Object? error) {
  if (error == null) return false;
  if (error is NoInternetConnection || error is ConnectionError) return true;
  if (error is String) return error == tr.noInternet;
  return false;
}

// ---------------------------------------------------------------------------
// CustomPagination
// ---------------------------------------------------------------------------
// WHY ConsumerStatefulWidget?
//
// The built-in pullToRefresh in RiverPagedBuilder calls `ref.refresh(provider)`
// which completely destroys and recreates the StateNotifier. This causes a
// double-fetch (and therefore duplicated items) because:
//   1. ref.refresh creates a new notifier with empty PagedState
//   2. _updatePagingState(PagedState()) sets _pagingController.value to null
//      → PagingController fires requestPage(1) → load(1, limit) ← fetch #1
//   3. ref.refresh itself triggers a second _updatePagingState call
//      → another requestPage(1) → load(1, limit) ← fetch #2
//   4. PagedNotifier.load appends records regardless of page key,
//      so both fetches produce 4 items each → 8 visible items (duplication).
//
// Fix: disable pullToRefresh on RiverPagedBuilder and wrap the list in our
// own RefreshIndicator that calls notifier.hardRefresh() — which only resets
// `state = const PagedState()` and lets PagingController trigger exactly ONE
// load(1, limit) naturally.
// ---------------------------------------------------------------------------
class CustomPagination<Model> extends ConsumerStatefulWidget {
  const CustomPagination({
    super.key,
    this.limit = 10,
    this.firstPageKey = 1,
    this.pullToRefresh = true,
    this.enableInfiniteScroll = true,
    this.invisibleItemsThreshold,
    this.noMoreItemsIndicatorBuilder,
    this.noItemsFoundIndicatorBuilder,
    this.newPageErrorIndicatorBuilder,
    this.firstPageErrorIndicatorBuilder,
    this.newPageProgressIndicatorBuilder,
    this.firstPageProgressIndicatorBuilder,
    required this.provider,
    required this.itemBuilder,
    this.pagedBuilder,
    this.loadingBuilder,
    this.isGrid = false,
    this.padding,
    this.onRefresh,
  });

  final EdgeInsetsGeometry? padding;

  /// Optional custom refresh handler. When [pullToRefresh] is true and this is
  /// provided, it will be called on pull-to-refresh instead of the default
  /// provider invalidation. Use this to call your notifier's [hardRefresh]
  /// to avoid double-fetch duplications.
  final Future<void> Function()? onRefresh;

  final InfiniteScrollProvider<int, Model> provider;
  final Widget Function(BuildContext context, Model model, int index)
      itemBuilder;
  final Widget Function(BuildContext, PagingController<dynamic, dynamic>)?
      loadingBuilder;
  final bool isGrid;
  final int firstPageKey;
  final int limit;
  final bool pullToRefresh;
  final bool enableInfiniteScroll;
  final int? invisibleItemsThreshold;
  final PagedBuilder<int, Model>? pagedBuilder;
  final Widget Function(BuildContext context, PagingController controller)?
      firstPageErrorIndicatorBuilder;
  final Widget Function(BuildContext context, PagingController controller)?
      firstPageProgressIndicatorBuilder;
  final Widget Function(BuildContext context, PagingController controller)?
      noItemsFoundIndicatorBuilder;
  final Widget Function(BuildContext context, PagingController controller)?
      newPageErrorIndicatorBuilder;
  final Widget Function(BuildContext context, PagingController controller)?
      newPageProgressIndicatorBuilder;
  final Widget Function(BuildContext context, PagingController controller)?
      noMoreItemsIndicatorBuilder;

  @override
  ConsumerState<CustomPagination<Model>> createState() =>
      _CustomPaginationState<Model>();
}

class _CustomPaginationState<Model>
    extends ConsumerState<CustomPagination<Model>> {
  /// Manually triggers a hard refresh: resets the notifier state to empty
  /// (PagedState()) so the PagingController detects the change, resets itself,
  /// and fires exactly ONE requestPage(1). We never call load() directly here
  /// to avoid double-fetching.
  Future<void> _onRefresh() async {
    if (widget.onRefresh != null) {
      await widget.onRefresh!();
    } else {
      globalRefContainer.invalidate(widget.provider);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget list = RiverPagedBuilder<int, Model>(
      firstPageKey: widget.firstPageKey,
      // Always disable the built-in pull-to-refresh; we wrap manually below.
      pullToRefresh: false,
      provider: widget.provider,
      limit: widget.limit,
      pagedBuilder: widget.pagedBuilder ??
          (controller, builder) => PagedListView(
                padding: widget.padding,
                builderDelegate: builder,
                pagingController: controller,
              ),
      itemBuilder: widget.itemBuilder,
      firstPageProgressIndicatorBuilder: widget.loadingBuilder ??
          widget.firstPageProgressIndicatorBuilder ??
          (context, controller) {
            return const SizedBox(
              width: double.infinity,
              height: 50,
              child: CupertinoActivityIndicator(
                color: AppColors.primary,
                animating: true,
                radius: 16.0,
              ),
            );
          },
      newPageProgressIndicatorBuilder: widget.newPageProgressIndicatorBuilder ??
          (widget.isGrid
              ? (context, controller) => const CupertinoActivityIndicator(
                    color: AppColors.primary,
                    animating: true,
                  )
              : (context, controller) {
                  return SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.primary,
                          ),
                          const Height(12),
                          Text(
                            tr.loadingMoreItems,
                            style: context.regular14TextSub,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
      enableInfiniteScroll: widget.enableInfiniteScroll,
      firstPageErrorIndicatorBuilder: widget.firstPageErrorIndicatorBuilder ??
          (context, controller) {
            final err = controller.value.error;
            if (_isOfflinePaginationError(err)) {
              return NoInternetScreen(
                isLoading: false,
                onRetry: () => globalRefContainer.invalidate(widget.provider),
              );
            }
            return ServerErrorScreen(
              isLoading: false,
              onRetry: () => globalRefContainer.invalidate(widget.provider),
            );
          },
      invisibleItemsThreshold: widget.invisibleItemsThreshold,
      newPageErrorIndicatorBuilder: widget.newPageErrorIndicatorBuilder ??
          (context, controller) {
            final err = controller.value.error;
            if (_isOfflinePaginationError(err)) {
              return NoInternetScreen(
                isLoading: false,
                onRetry: () => globalRefContainer.invalidate(widget.provider),
              );
            }
            return ServerErrorScreen(
              isLoading: false,
              onRetry: () => globalRefContainer.invalidate(widget.provider),
            );
          },
      noItemsFoundIndicatorBuilder: widget.noItemsFoundIndicatorBuilder ??
          (context, controller) {
            return Center(
              child: Column(
                children: [
                  const Height(32),
                  Text(
                    tr.noItemsFound,
                    style: context.regular18TextMain,
                  ),
                  const Height(16),
                  Text(
                    tr.thisListIsCurrentlyEmpty,
                    style: context.regular16TextSub,
                  ),
                ],
              ),
            );
          },
      noMoreItemsIndicatorBuilder: widget.noMoreItemsIndicatorBuilder,
    );

    if (widget.pullToRefresh) {
      list = RefreshIndicator(
        onRefresh: _onRefresh,
        child: list,
      );
    }

    return list;
  }
}
