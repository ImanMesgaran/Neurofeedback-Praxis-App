part of 'events_cubit.dart';

class EventsState {
  final String? failure;
  final bool isFailure;
  final bool isLoading;
  final List<EventModel> events;
  final String currentTabIndexName;

  EventsState({
    required this.failure,
    required this.isFailure,
    required this.isLoading,
    required this.events,
    required this.currentTabIndexName,
  });

  factory EventsState.initial() {
    return EventsState(
      isLoading: false,
      failure: null,
      isFailure: false,
      events: [],
      currentTabIndexName: 'page_news',
    );
  }

  factory EventsState.tabIndexChanged({
    required EventsState prevState,
    required String currentTabIndexName,
  }) =>
      EventsState(
        isLoading: false,
        failure: null,
        isFailure: false,
        events: prevState.events,
        currentTabIndexName: currentTabIndexName,
      );
}
