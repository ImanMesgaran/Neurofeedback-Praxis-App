/*
part of 'browse_cubit.dart';

class BrowseState extends Equatable {
  final HttpServiceError? failure;
  final bool isFailure;
  final bool isLoading;
  final bool isFeedLoading;
  final bool shouldShowFeed;
  final List<BrowseRecentModel> feeds;
  final List<PostModel> searchResults;
  final bool isBrowseSearchLoading;
  final List<PostType> selectedContentType;
  final List<TopicModel> allTopic;
  final List<TopicModel> selectedTopic;
  final bool isLoadingTopics;
  final List<AuthorModel> allAuthor;
  final List<AuthorModel> selectedAuthor;
  final bool isLoadingAuthors;
  final List<PublisherModel> allPublishers;
  final List<PublisherModel> selectedPublisher;
  final bool isLoadingPublishers;
  final String query;
  final bool isSearchResult;
  final int page;
  final SortBrowseSearch sort;

  const BrowseState({
    required this.failure,
    required this.isLoading,
    required this.isFailure,
    required this.isFeedLoading,
    required this.shouldShowFeed,
    required this.feeds,
    required this.searchResults,
    required this.isBrowseSearchLoading,
    required this.selectedTopic,
    required this.allTopic,
    required this.isLoadingTopics,
    required this.selectedContentType,
    required this.selectedAuthor,
    required this.allAuthor,
    required this.isLoadingAuthors,
    required this.selectedPublisher,
    required this.allPublishers,
    required this.isLoadingPublishers,
    required this.query,
    required this.isSearchResult,
    required this.page,
    required this.sort,
  });

  factory BrowseState.initial() => const BrowseState(
        failure: null,
        isFailure: false,
        isLoading: false,
        shouldShowFeed: false,
        feeds: [],
        isFeedLoading: false,
        query: '',
        searchResults: [],
        isBrowseSearchLoading: false,
        selectedTopic: [],
        allTopic: [],
        isLoadingTopics: false,
        selectedContentType: [],
        selectedAuthor: [],
        allAuthor: [],
        isLoadingAuthors: false,
        allPublishers: [],
        selectedPublisher: [],
        isLoadingPublishers: false,
        isSearchResult: false,
        page: 1,
        sort: SortBrowseSearch.popular,
      );

  factory BrowseState.loading({
    required BrowseState prevState,
  }) {
    return BrowseState(
      failure: null,
      isFailure: false,
      isLoading: true,
      shouldShowFeed: prevState.shouldShowFeed,
      feeds: prevState.feeds,
      isFeedLoading: prevState.isFeedLoading,
      query: prevState.query,
      searchResults: prevState.searchResults,
      isBrowseSearchLoading: prevState.isBrowseSearchLoading,
      selectedTopic: prevState.selectedTopic,
      allTopic: prevState.allTopic,
      isLoadingTopics: prevState.isLoadingTopics,
      selectedContentType: prevState.selectedContentType,
      selectedAuthor: prevState.selectedAuthor,
      allAuthor: prevState.allAuthor,
      isLoadingAuthors: prevState.isLoadingAuthors,
      allPublishers: prevState.allPublishers,
      selectedPublisher: prevState.selectedPublisher,
      isLoadingPublishers: prevState.isLoadingPublishers,
      isSearchResult: prevState.isSearchResult,
      page: prevState.page,
      sort: prevState.sort,
    );
  }

  factory BrowseState.loadedFeeds({
    required BrowseState prevState,
    required List<BrowseRecentModel> feeds,
  }) {
    return BrowseState(
      failure: null,
      isFailure: false,
      isLoading: false,
      shouldShowFeed: shouldShowFeeds(prevState),
      feeds: feeds,
      isFeedLoading: false,
      query: prevState.query,
      searchResults: prevState.searchResults,
      isBrowseSearchLoading: prevState.isBrowseSearchLoading,
      selectedTopic: prevState.selectedTopic,
      allTopic: prevState.allTopic,
      isLoadingTopics: false,
      selectedContentType: prevState.selectedContentType,
      selectedAuthor: prevState.selectedAuthor,
      allAuthor: prevState.allAuthor,
      isLoadingAuthors: false,
      allPublishers: prevState.allPublishers,
      selectedPublisher: prevState.selectedPublisher,
      isLoadingPublishers: false,
      isSearchResult: isSearchResults(prevState),
      page: prevState.page,
      sort: prevState.sort,
    );
  }

  static bool shouldShowFeeds(BrowseState prevState) {
    if (prevState.query.isNotEmpty) {
      return false;
    } else if (prevState.selectedAuthor.isNotEmpty ||
        prevState.selectedContentType.isNotEmpty ||
        prevState.selectedTopic.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static bool isSearchResults(BrowseState prevState) {
    if (prevState.query.isNotEmpty) {
      return true;
    } else if (prevState.selectedAuthor.isNotEmpty ||
        prevState.selectedContentType.isNotEmpty ||
        prevState.selectedTopic.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  factory BrowseState.searchLoaded({
    required BrowseState prevState,
    required List<PostModel> searchResults,
    required int page,
  }) =>
      BrowseState(
        failure: null,
        isFailure: false,
        isLoading: false,
        shouldShowFeed: false,
        feeds: prevState.feeds,
        isFeedLoading: false,
        query: prevState.query,
        searchResults: searchResults,
        isBrowseSearchLoading: false,
        selectedTopic: prevState.selectedTopic,
        allTopic: prevState.allTopic,
        isLoadingTopics: prevState.isLoadingTopics,
        selectedContentType: prevState.selectedContentType,
        selectedAuthor: prevState.selectedAuthor,
        allAuthor: prevState.allAuthor,
        isLoadingAuthors: prevState.isLoadingAuthors,
        allPublishers: prevState.allPublishers,
        selectedPublisher: prevState.selectedPublisher,
        isLoadingPublishers: prevState.isLoadingPublishers,
        isSearchResult: true,
        page: page,
        sort: SortBrowseSearch.popular,
      );

  factory BrowseState.loadedTopics({
    required BrowseState prevState,
    required List<TopicModel> topics,
  }) =>
      BrowseState(
        failure: null,
        isFailure: false,
        isLoading: false,
        shouldShowFeed: false,
        feeds: prevState.feeds,
        isFeedLoading: prevState.isFeedLoading,
        query: prevState.query,
        searchResults: prevState.searchResults,
        isBrowseSearchLoading: prevState.isBrowseSearchLoading,
        selectedTopic: prevState.selectedTopic,
        allTopic: topics,
        isLoadingTopics: false,
        selectedContentType: prevState.selectedContentType,
        selectedAuthor: prevState.selectedAuthor,
        allAuthor: prevState.allAuthor,
        isLoadingAuthors: prevState.isLoadingAuthors,
        allPublishers: prevState.allPublishers,
        selectedPublisher: prevState.selectedPublisher,
        isLoadingPublishers: prevState.isLoadingPublishers,
        isSearchResult: prevState.isSearchResult,
        page: prevState.page,
        sort: prevState.sort,
      );

  factory BrowseState.loadedAuthors({
    required BrowseState prevState,
    required List<AuthorModel> authors,
  }) =>
      BrowseState(
        failure: null,
        isFailure: false,
        isLoading: false,
        shouldShowFeed: false,
        feeds: prevState.feeds,
        isFeedLoading: prevState.isFeedLoading,
        query: prevState.query,
        searchResults: prevState.searchResults,
        isBrowseSearchLoading: prevState.isBrowseSearchLoading,
        selectedTopic: prevState.selectedTopic,
        allTopic: prevState.allTopic,
        isLoadingTopics: prevState.isLoadingTopics,
        selectedContentType: prevState.selectedContentType,
        allAuthor: authors,
        selectedAuthor: prevState.selectedAuthor,
        isLoadingAuthors: false,
        allPublishers: prevState.allPublishers,
        selectedPublisher: prevState.selectedPublisher,
        isLoadingPublishers: prevState.isLoadingPublishers,
        isSearchResult: prevState.isSearchResult,
        page: prevState.page,
        sort: prevState.sort,
      );

  // publishers
  factory BrowseState.loadedPublishers({
    required BrowseState prevState,
    required List<PublisherModel> publishers,
  }) =>
      BrowseState(
        failure: null,
        isFailure: false,
        isLoading: false,
        shouldShowFeed: false,
        feeds: prevState.feeds,
        isFeedLoading: prevState.isFeedLoading,
        query: prevState.query,
        searchResults: prevState.searchResults,
        isBrowseSearchLoading: prevState.isBrowseSearchLoading,
        selectedTopic: prevState.selectedTopic,
        allTopic: prevState.allTopic,
        isLoadingTopics: prevState.isLoadingTopics,
        selectedContentType: prevState.selectedContentType,
        allAuthor: prevState.allAuthor,
        selectedAuthor: prevState.selectedAuthor,
        isLoadingAuthors: prevState.isLoadingAuthors,
        allPublishers: publishers,
        selectedPublisher: prevState.selectedPublisher,
        isLoadingPublishers: false,
        isSearchResult: prevState.isSearchResult,
        page: prevState.page,
        sort: prevState.sort,
      );

  factory BrowseState.failure({
    required BrowseState prevState,
    required HttpServiceError serverFailure,
  }) {
    final state = BrowseState(
      isLoading: false,
      isFailure: true,
      failure: serverFailure,
      shouldShowFeed: prevState.shouldShowFeed,
      feeds: prevState.feeds,
      isFeedLoading: prevState.isFeedLoading,
      query: prevState.query,
      searchResults: prevState.searchResults,
      isBrowseSearchLoading: prevState.isBrowseSearchLoading,
      selectedTopic: prevState.selectedTopic,
      allTopic: prevState.allTopic,
      isLoadingTopics: prevState.isLoadingTopics,
      selectedContentType: prevState.selectedContentType,
      selectedAuthor: prevState.selectedAuthor,
      allAuthor: prevState.allAuthor,
      isLoadingAuthors: prevState.isLoadingAuthors,
      allPublishers: prevState.allPublishers,
      selectedPublisher: prevState.selectedPublisher,
      isLoadingPublishers: prevState.isLoadingPublishers,
      isSearchResult: prevState.isSearchResult,
      page: prevState.page,
      sort: prevState.sort,
    );

    return state;
  }

  BrowseState copyWith({
    HttpServiceError? failure,
    bool? isLoading,
    bool? areAssetsLoaded,
    bool? isAssetDetailLoaded,
    bool? shouldShowFeed,
    List<BrowseRecentModel>? feeds,
    bool? isFeedLoading,
    String? query,
    List<PostModel>? searchResults,
    bool? isBrowseSearchLoading,
    List<TopicModel>? selectedTopic,
    List<TopicModel>? allTopic,
    bool? isLoadingTopics,
    List<PostType>? selectedContentType,
    List<AuthorModel>? selectedAuthor,
    List<AuthorModel>? allAuthor,
    bool? isLoadingAuthors,
    List<PublisherModel>? allPublishers,
    List<PublisherModel>? selectedPublisher,
    bool? isLoadingPublishers,
    bool? isSearchResult,
    int? page,
    SortBrowseSearch? sort,
  }) {
    return BrowseState(
      isFailure: false,
      failure: failure ?? this.failure,
      isLoading: isLoading ?? this.isLoading,
      shouldShowFeed: shouldShowFeed ?? this.shouldShowFeed,
      feeds: feeds ?? this.feeds,
      isFeedLoading: isFeedLoading ?? this.isFeedLoading,
      query: query ?? this.query,
      searchResults: searchResults ?? this.searchResults,
      isBrowseSearchLoading:
          isBrowseSearchLoading ?? this.isBrowseSearchLoading,
      selectedTopic: selectedTopic ?? this.selectedTopic,
      allTopic: allTopic ?? this.allTopic,
      isLoadingTopics: isLoadingTopics ?? this.isLoadingTopics,
      selectedContentType: selectedContentType ?? this.selectedContentType,
      selectedAuthor: selectedAuthor ?? this.selectedAuthor,
      allAuthor: allAuthor ?? this.allAuthor,
      isLoadingAuthors: isLoadingAuthors ?? this.isLoadingAuthors,
      isSearchResult: isSearchResult ?? this.isSearchResult,
      allPublishers: allPublishers ?? this.allPublishers,
      selectedPublisher: selectedPublisher ?? this.selectedPublisher,
      isLoadingPublishers: isLoadingPublishers ?? this.isLoadingPublishers,
      page: page ?? this.page,
      sort: sort ?? this.sort,
    );
  }

  @override
  List<Object?> get props => [
        failure,
        isLoading,
        isFailure,
        shouldShowFeed,
        feeds,
        isFeedLoading,
        query,
        searchResults,
        isBrowseSearchLoading,
        selectedTopic,
        selectedContentType,
        selectedAuthor,
        isSearchResult,
        page,
        allAuthor,
        isLoadingAuthors,
        allTopic,
        isLoadingTopics,
        sort,
        allPublishers,
        selectedPublisher,
        isLoadingPublishers,
      ];
}
*/
