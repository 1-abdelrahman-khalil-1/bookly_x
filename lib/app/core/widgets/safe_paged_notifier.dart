import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

/// A drop-in replacement for [PagedNotifier] that prevents duplicated items
/// caused by concurrent or repeated load calls for the same page.
///
/// ## Why this exists
/// The original [PagedNotifier.load] always appends records:
///   `records: [...(state.records ?? []), ...(records ?? [])]`
/// It relies on `previousPageKeys` to de-duplicate, but there is a race
/// condition when [RiverPagedBuilder]'s internal `ref.refresh` triggers TWO
/// `requestPage(1)` calls before the first one has added `1` to
/// `previousPageKeys`. The result is duplicated items in the list.
///
/// ## How this fixes it
/// 1. `_loadingPages` — an in-memory set that tracks which pages are
///    *currently being fetched*. A concurrent call for the same page is
///    dropped instantly (no async gap between the check and the add because
///    Dart is single-threaded: both happen synchronously before any `await`).
/// 2. `previousPageKeys` guard — unchanged from the original; prevents
///    re-loading a page that was already successfully fetched.
/// 3. `hardRefresh()` — resets state to [PagedState()] which clears both
///    `records` and `previousPageKeys`, allowing the list to refetch from
///    page 1. The caller must NOT call `load(1, limit)` directly afterward;
///    [RiverPagedBuilder] will trigger the fetch automatically.
class SafePagedNotifier<PageKeyType, ItemType>
    extends StateNotifier<PagedState<PageKeyType, ItemType>>
    with
        PagedNotifierMixin<PageKeyType, ItemType,
            PagedState<PageKeyType, ItemType>> {
  final LoadFunction<PageKeyType, ItemType> _load;
  final NextPageKeyBuilder<PageKeyType, ItemType> nextPageKeyBuilder;
  final dynamic Function(dynamic error)? errorBuilder;
  final bool printStackTrace;

  /// Tracks pages that are currently mid-flight so concurrent calls are
  /// dropped. Checked and updated synchronously (before the first `await`)
  /// so there is no race condition.
  final Set<PageKeyType> _loadingPages = {};

  SafePagedNotifier({
    required LoadFunction<PageKeyType, ItemType> load,
    required this.nextPageKeyBuilder,
    this.errorBuilder,
    this.printStackTrace = false,
  })  : _load = load,
        super(PagedState<PageKeyType, ItemType>());

  @override
  Future<List<ItemType>?> load(PageKeyType page, int limit) async {
    // Guard 1: drop concurrent call for the same page (sync check + sync add).
    if (_loadingPages.contains(page)) return null;

    // Guard 2: page already successfully fetched — notify builder but skip fetch.
    if (state.previousPageKeys.contains(page)) {
      Future.microtask(() {
        if (mounted) state = state.copyWith();
      });
      return null;
    }

    _loadingPages.add(page); // ← sync, no await before this

    try {
      final records = await _load(page, limit);
      if (!mounted) return null;

      state = state.copyWith(
        records: [
          ...(state.records ?? <ItemType>[]),
          ...(records ?? <ItemType>[]),
        ],
        nextPageKey: nextPageKeyBuilder(records, page, limit),
        previousPageKeys: {...state.previousPageKeys, page}.toList(),
      );

      return records;
    } catch (e, stacktrace) {
      if (mounted) {
        state = state.copyWith(
          error: errorBuilder != null
              ? errorBuilder!(e)
              : 'An error occurred. Please try again.',
        );
        debugPrint(e.toString());
        if (printStackTrace) debugPrint(stacktrace.toString());
      }
    } finally {
      _loadingPages.remove(page);
    }

    return null;
  }

  /// Resets to empty [PagedState] so [RiverPagedBuilder] triggers a fresh
  /// page-1 fetch automatically. Do NOT call [load] here — that would cause
  /// a double-fetch and duplicated items.
  void hardRefresh() {
    _loadingPages.clear();
    state = PagedState<PageKeyType, ItemType>();
  }
}
