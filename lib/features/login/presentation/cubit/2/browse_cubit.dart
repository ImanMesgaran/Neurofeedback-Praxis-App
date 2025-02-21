/*
import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bright_app/core/models/search_query_enums.dart';
import 'package:bright_app/core/models/topic.dart';
import 'package:bright_app/core/network/http_service_error.dart';
import 'package:bright_app/features/browse/data/models/browse_recent_general_model.dart';
import 'package:bright_app/features/browse/data/models/browse_search_params_model.dart';
import 'package:bright_app/features/browse/domain/use_cases/get_browse_search.dart';
import 'package:bright_app/features/browse/domain/use_cases/get_feed.dart';
import 'package:bright_app/features/browse/domain/use_cases/get_publishers.dart';
import 'package:bright_app/features/browse/domain/use_cases/get_topics.dart';
import 'package:bright_app/features/browse/domain/use_cases/load_authors.dart';
import 'package:bright_app/features/post/data/models/author.dart';
import 'package:bright_app/features/post/data/models/post.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'browse_state.dart';

@injectable
class BrowseCubit extends Cubit<BrowseState> {
  final GetBrowseRecentFeed getBrowseRecentFeed;
  final GetBrowseSearch getBrowseSearch;
  final LoadAuthors loadAuthors;
  final GetTopics getTopics;
  final GetPublishers getPublishers;

  BrowseCubit({
    required this.getBrowseRecentFeed,
    required this.getBrowseSearch,
    required this.loadAuthors,
    required this.getTopics,
    required this.getPublishers,
  }) : super(BrowseState.initial());

  int _currentPage = 1; // Track the current page
  bool _hasMoreResults = true; // Check if there are more results

  String _query = '';

  void emitState(BrowseState browseState) {
    emit(browseState);
  }

  Future<void> loadRecentFeeds() async {
    emit(BrowseState.loading(prevState: state));

    final failureOrFeeds = await getBrowseRecentFeed();

    failureOrFeeds.fold(
      (failure) {
        emit(
          BrowseState.failure(prevState: state, serverFailure: failure),
        );
      },
      (feedsData) {
        emit(
          BrowseState.loadedFeeds(
            prevState: state,
            feeds: feedsData,
          ),
        );
      },
    );
  }

  void refreshSearch({
    required String query,
    SortBrowseSearch sort = SortBrowseSearch.popular,
  }) {
    emit(
      state.copyWith(
        isSearchResult: false,
        isBrowseSearchLoading: true,
        isLoading: true,
        sort: sort,
        searchResults: [],
        shouldShowFeed: false,
      ),
    );

    _currentPage = 1;
    _hasMoreResults = true;

    browseSearchOnSubmit(
      isLoadingMore: false,
      term: query,
      sort: state.sort,
      authors: state.selectedAuthor.map((e) => e.slug).toList(),
      topics: state.selectedTopic.map((e) => e.hash).toList(),
      // ARTICLE, BOOK, VIDEO, AUDIO, NEWS, EVENT
      types:
          state.selectedContentType.map((e) => e.name.toUpperCase()).toList(),
      publishers: state.selectedPublisher.map((e) => e.shortname).toList(),
    );
  }

  void refreshBrowseFilters() {
    clearAuthors();
    clearContentType();
    clearTopics();
    emit(
      state.copyWith(
        query: '',
        searchResults: [],
        isSearchResult: false,
        shouldShowFeed: true,
      ),
    );
  }

  Future<void> browseSearchOnSubmit({
    required bool isLoadingMore,
    int page = 1,
    SortBrowseSearch sort = SortBrowseSearch.popular,
    String term = '',
    List<String>? authors,
    List<String>? topics,
    List<String>? types,
    List<String>? publishers,
  }) async {
    emit(state.copyWith(isLoading: true, query: term));

    final typesUpperCase = types?.map((e) => e.toUpperCase()).toList();

    if (!_hasMoreResults) return;

    final failureOrSearchResult = await getBrowseSearch(
      params: BrowseSearchParamsModel(
        page: (_query != term) ? 1 : _currentPage,
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

    if (_query != term ||
        !state.selectedAuthor.contains(authors) ||
        !state.selectedContentType.contains(types) ||
        !state.selectedTopic.contains(authors) ||
        !state.selectedPublisher.contains(publishers)) {
      emit(
        state.copyWith(
          searchResults: previousSearch,
          page: _currentPage,
          isLoading: true,
          isBrowseSearchLoading: false,
        ),
      );
    } else {
      previousSearch = state.searchResults;
    }
    _query = term;

    await failureOrSearchResult.fold(
      (failure) {
        emit(
          BrowseState.failure(prevState: state, serverFailure: failure),
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

  Future<void> getBrowseAuthors() async {
    //emit(state.copyWith(isLoadingAuthors: true));
    emit(BrowseState.loading(prevState: state));

    final failureOrAuthorsResult = await loadAuthors();

    await failureOrAuthorsResult.fold(
      (failure) {
        emit(
          BrowseState.failure(prevState: state, serverFailure: failure),
        );
        // throw UnimplementedError();
      },
      (items) async {
        final authors = items;
        emit(BrowseState.loadedAuthors(prevState: state, authors: authors));
      },
    );
  }

  Future<void> getBrowseTopics() async {
    // emit(state.copyWith(isLoadingTopics: true));
    emit(BrowseState.loading(prevState: state));

    final failureOrTopicResult = await getTopics();

    await failureOrTopicResult.fold(
      (failure) {
        emit(
          BrowseState.failure(prevState: state, serverFailure: failure),
        );
        // throw UnimplementedError();
      },
      (items) async {
        emit(BrowseState.loadedTopics(prevState: state, topics: items));
      },
    );
  }

  Future<void> getBrowsePublishers() async {
    emit(state.copyWith(isLoadingPublishers: true));
    // emit(BrowseState.loading(prevState: state));

    final failureOrPublishersResult = await getPublishers();

    await failureOrPublishersResult.fold(
      (failure) {
        emit(
          BrowseState.failure(prevState: state, serverFailure: failure),
        );
      },
      (items) async {
        emit(BrowseState.loadedPublishers(prevState: state, publishers: items));
      },
    );
  }

  void setTopics(List<TopicModel> topics) {
    emit(state.copyWith(selectedTopic: topics));

    refreshSearchByQueryAndFilters();
  }

  void setContentType(List<PostType> contentType) {
    emit(state.copyWith(selectedContentType: contentType));

    refreshSearchByQueryAndFilters();
  }

  void setAuthors(List<AuthorModel> authors) {
    emit(state.copyWith(selectedAuthor: authors));

    refreshSearchByQueryAndFilters();
  }

  void setPublishers(List<PublisherModel> publishers) {
    emit(state.copyWith(selectedPublisher: publishers));

    refreshSearchByQueryAndFilters();
  }

  void addSelectedTopic(TopicModel topic) {
    final List<TopicModel> list = [];
    list.addAll(state.selectedTopic);
    if (!list.contains(topic)) {
      list.add(topic);
    } else {
      list.remove(topic);
    }

    if (list.isNotEmpty) {
      emit(
        state.copyWith(
          selectedTopic: list,
        ),
      );
    } else {
      emit(
        state.copyWith(
          selectedTopic: list,
        ),
      );
    }

    refreshSearchByQueryAndFilters();
  }

  void clearTopics() {
    final List<TopicModel> list = [];

    emit(state.copyWith(selectedTopic: list));

    refreshSearchByQueryAndFilters();
  }

  // void addSelectedAuthor(String author) {
  //   final List<String> list = [...state.selectedAuthor];
  //   if (!list.contains(author)) {
  //     list.add(author);
  //   } else {
  //     list.remove(author);
  //   }
  //   if (list.isNotEmpty) {
  //     emit(
  //       state.copyWith(
  //         selectedAuthor: list,
  //       ),
  //     );
  //   } else {
  //     emit(
  //       state.copyWith(
  //         selectedAuthor: list,
  //       ),
  //     );
  //   }

  //   refreshSearchByQueryAndFilters();
  // }

  void clearPublishers() {
    final List<PublisherModel> list = [];

    emit(state.copyWith(selectedPublisher: list));

    refreshSearchByQueryAndFilters();
  }

  void clearAuthors() {
    final List<AuthorModel> list = [];

    emit(state.copyWith(selectedAuthor: list));

    refreshSearchByQueryAndFilters();
  }

  void addSelectedContentType(PostType contentType) {
    final List<PostType> list = [];
    list.addAll(state.selectedContentType);
    if (!list.contains(contentType)) {
      list.add(contentType);
    } else {
      list.remove(contentType);
    }

    if (list.isNotEmpty) {
      emit(
        state.copyWith(
          selectedContentType: list,
        ),
      );
    } else {
      emit(
        state.copyWith(
          selectedContentType: list,
        ),
      );
    }

    refreshSearchByQueryAndFilters();
  }

  void clearContentType() {
    final List<PostType> list = [];

    emit(state.copyWith(selectedContentType: list));

    refreshSearchByQueryAndFilters();
  }

  void refreshSearchByQueryAndFilters() {
    if (state.query.isEmpty &&
        state.selectedAuthor.isEmpty &&
        state.selectedContentType.isEmpty &&
        state.selectedTopic.isEmpty &&
        state.selectedPublisher.isEmpty) {
      emit(
        state.copyWith(
          searchResults: [],
          isSearchResult: false,
          isLoading: false,
        ),
      );
    } else {
      refreshSearch(query: state.query);
    }
  }

  Future<void> clearSearchString() async {
    emit(
      state.copyWith(
        query: '',
        searchResults: [],
        isSearchResult: false,
      ),
    );

    await Future.value();
  }

  String? joinSelectedTopicsByDelimeters() {
    return state.selectedTopic.isNotEmpty
        ? joinListToString(
            list: state.selectedTopic.map((e) => e.hash).toList(),
          )
        : null;
  }

  String? joinAuthorsByDelimeters() {
    return state.selectedAuthor.isNotEmpty
        ? joinListToString(
            list: state.selectedAuthor.map((e) => e).toList(),
          )
        : null;
  }

  String joinListToString<T>({required List<T> list}) {
    return list.join(', ');
  }
}
*/
