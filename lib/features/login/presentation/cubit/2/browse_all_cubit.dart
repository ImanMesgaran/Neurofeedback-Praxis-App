

/*/
import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:bright_app/core/models/search_query_enums.dart';
import 'package:bright_app/features/browse/data/models/browse_search_params_model.dart';
import 'package:bright_app/features/browse/domain/use_cases/get_browse_search.dart';
import 'package:bright_app/features/browse/presentation/manager/browse_all_state.dart';
import 'package:bright_app/features/post/data/models/post.dart';

class BrowseAllCubit extends Cubit<BrowseAllState> {
  final GetBrowseSearch getBrowseSearch;

  BrowseAllCubit({
    required this.getBrowseSearch,
  }) : super(BrowseAllState.initial());

  int _currentPage = 1; // Track the current page
  bool _hasMoreResults = true; // Check if there are more results

  Future<void> browseSearchOnSubmit({
    required bool isLoadingMore,
    int page = 1,
    SortBrowseSearch sort = SortBrowseSearch.newest,
    String term = '',
    List<String>? authors,
    List<String>? topics,
    List<String>? types,
    List<String>? publishers,
  }) async {
    emit(state.copyWith(isLoading: true));

    final typesUpperCase = types?.map((e) => e.toUpperCase()).toList();

    if (!_hasMoreResults) return;

    final failureOrSearchResult = await getBrowseSearch(
      params: BrowseSearchParamsModel(
        page: _currentPage,
        sort: sort,
        term: term,
        authors: authors,
        topics: topics,
        types: typesUpperCase,
        publishers: publishers,
      ),
    );

    List<PostModel> previousSearch = [];

    if (isLoadingMore) {
      previousSearch.addAll(state.searchResults);
    }

    previousSearch = state.searchResults;

    await failureOrSearchResult.fold(
      (failure) {
        emit(
          BrowseAllState.failure(prevState: state, serverFailure: failure),
        );
      },
      (paginatedItems) async {
        final items = paginatedItems.data;
        _hasMoreResults = paginatedItems.hasNext;

        log('hasMoreResults = $_hasMoreResults');
        log('totalRecords = ${paginatedItems.totalRecords}');

        _currentPage++;

        if (paginatedItems.data.isNotEmpty) {
          emit(
            state.copyWith(
              searchResults: [...previousSearch, ...paginatedItems.data],
              isLoading: false,
              isBrowseSearchLoading: false,
              page: _currentPage,
              isSearchResult: true,
            ),
          );
        } else {
          // No more results, set _hasMoreResults to false
          _hasMoreResults = false;
          emit(
            state.copyWith(
              isLoading: false,
              isBrowseSearchLoading: false,
              isSearchResult: true,
            ),
          );
        }
      },
    );
  }
}
*/