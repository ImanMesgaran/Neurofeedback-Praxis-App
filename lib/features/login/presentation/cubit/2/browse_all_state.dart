// Events
/*

import 'package:bright_app/core/models/search_query_enums.dart';
import 'package:bright_app/core/network/http_service_error.dart';
import 'package:bright_app/features/post/data/models/post.dart';
import 'package:equatable/equatable.dart';

class BrowseAllState extends Equatable {
  final HttpServiceError? failure;
  final bool isLoading;
  final int page;

  final List<PostModel> searchResults;
  final bool isBrowseSearchLoading;
  final bool isLoadingTopics;
  final bool isLoadingAuthors;
  final String query;
  final bool isSearchResult;
  final SortBrowseSearch sort;

  const BrowseAllState({
    required this.failure,
    required this.isLoading,
    required this.page,
    required this.searchResults,
    required this.isBrowseSearchLoading,
    required this.isLoadingTopics,
    required this.isLoadingAuthors,
    required this.query,
    required this.isSearchResult,
    required this.sort,
  });

  factory BrowseAllState.initial() => const BrowseAllState(
        failure: null,
        // isFailure: false,
        isLoading: false,
        page: 1,
        query: '',
        searchResults: [],
        isBrowseSearchLoading: false,
        isLoadingTopics: false,
        isLoadingAuthors: false,
        isSearchResult: false,
        sort: SortBrowseSearch.popular,
      );

  factory BrowseAllState.loading({
    required BrowseAllState prevState,
    required bool isLoading,
  }) {
    return BrowseAllState(
      failure: null,
      // isFailure: false,
      isLoading: isLoading,
      page: prevState.page,
      query: prevState.query,
      searchResults: prevState.searchResults,
      isBrowseSearchLoading: prevState.isBrowseSearchLoading,
      isLoadingTopics: prevState.isLoadingTopics,
      isLoadingAuthors: prevState.isLoadingAuthors,
      isSearchResult: prevState.isSearchResult,
      sort: prevState.sort,
    );
  }

  factory BrowseAllState.searchLoaded({
    required BrowseAllState prevState,
    required List<PostModel> searchResults,
    required int page,
  }) =>
      BrowseAllState(
        failure: null,
        isLoading: false,
        query: prevState.query,
        searchResults: searchResults,
        isBrowseSearchLoading: false,
        isLoadingTopics: prevState.isLoadingTopics,
        isLoadingAuthors: prevState.isLoadingAuthors,
        isSearchResult: true,
        page: page,
        sort: SortBrowseSearch.popular,
      );

  factory BrowseAllState.failure({
    required BrowseAllState prevState,
    required HttpServiceError serverFailure,
  }) {
    final state = BrowseAllState(
      isLoading: false,
      failure: serverFailure,
      page: prevState.page,
      query: prevState.query,
      searchResults: prevState.searchResults,
      isBrowseSearchLoading: prevState.isBrowseSearchLoading,
      isLoadingTopics: prevState.isLoadingTopics,
      isLoadingAuthors: prevState.isLoadingAuthors,
      isSearchResult: prevState.isSearchResult,
      sort: SortBrowseSearch.popular,
    );

    return state;
  }

  BrowseAllState copyWith({
    HttpServiceError? failure,
    bool? isLoading,
    List<PostModel>? paginationTopic,
    int? page,
    bool? areAssetsLoaded,
    bool? isAssetDetailLoaded,
    bool? shouldShowFeed,
    bool? isFeedLoading,
    String? query,
    List<PostModel>? searchResults,
    bool? isBrowseSearchLoading,
    bool? isLoadingTopics,
    List<PostType>? selectedContentType,
    bool? isLoadingAuthors,
    bool? isSearchResult,
    SortBrowseSearch? sort,
  }) {
    return BrowseAllState(
      failure: failure ?? this.failure,
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
      query: query ?? this.query,
      searchResults: searchResults ?? this.searchResults,
      isBrowseSearchLoading:
          isBrowseSearchLoading ?? this.isBrowseSearchLoading,
      isLoadingTopics: isLoadingTopics ?? this.isLoadingTopics,
      isLoadingAuthors: isLoadingAuthors ?? this.isLoadingAuthors,
      isSearchResult: isSearchResult ?? this.isSearchResult,
      sort: sort ?? this.sort,
    );
  }

  @override
  List<Object?> get props => [
        failure,
        isLoading,
        page,
        searchResults,
        isBrowseSearchLoading,
        isLoadingTopics,
        isLoadingAuthors,
        query,
        isSearchResult,
        sort,
      ];
}

*/
