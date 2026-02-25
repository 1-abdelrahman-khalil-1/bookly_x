import 'package:flutter/cupertino.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../generated/translations.g.dart';
import '../../../main.dart';
import 'api_helper/exceptions.dart';
import 'screens_not_related/no_internet_screen.dart';
import 'screens_not_related/server_error_screen.dart';

class CustomPagination<Model> extends StatelessWidget {
  const CustomPagination({
    super.key,
    this.limit = 10,
    this.firstPageKey = 1,
    this.pullToRefresh = true,
    this.enableInfiniteScroll = true,
    this.loadingScrollDirection = Axis.vertical,
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
    required this.loadingBuilder,
  });

  final InfiniteScrollProvider<int, Model> provider;
  final Widget Function(BuildContext context, Model model, int index)
      itemBuilder;
  final Widget Function(BuildContext, PagingController<dynamic, dynamic>)
      loadingBuilder;
  final Axis loadingScrollDirection;
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
  Widget build(BuildContext context) {
    return RiverPagedBuilder<int, Model>(
      firstPageKey: firstPageKey,
      pullToRefresh: pullToRefresh,
      provider: provider,
      limit: limit,
      pagedBuilder: pagedBuilder ??
          (controller, builder) => PagedListView(
                builderDelegate: builder,
                pagingController: controller,
              ),
      itemBuilder: itemBuilder,
      firstPageProgressIndicatorBuilder: loadingBuilder,
      newPageProgressIndicatorBuilder: newPageProgressIndicatorBuilder,
      enableInfiniteScroll: enableInfiniteScroll,
      firstPageErrorIndicatorBuilder: firstPageErrorIndicatorBuilder ??
          (context, controller) {
            return controller.value.error == NoInternetConnection().toString()
                ? NoInternetScreen(
                    isLoading: false,
                    onRetry: () => globalRefContainer.invalidate(provider),
                  )
                : ServerErrorScreen(
                    isLoading: false,
                    onRetry: () => globalRefContainer.invalidate(provider),
                  );
          },
      invisibleItemsThreshold: invisibleItemsThreshold,
      newPageErrorIndicatorBuilder: newPageErrorIndicatorBuilder ??
          (context, controller) {
            return SizedBox(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text(tr.errorOccurred),
              ),
            );
          },
      noItemsFoundIndicatorBuilder: noItemsFoundIndicatorBuilder,
      noMoreItemsIndicatorBuilder: noMoreItemsIndicatorBuilder,
    );
  }
}
