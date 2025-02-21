import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neurofeedback_praxis_app/features/events/data/models/event_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  final SupabaseClient _client = Supabase.instance.client;

  EventsCubit() : super(EventsState.initial());

  void changeCurrentTab({required String tabName}) {
    emit(EventsState.tabIndexChanged(
      prevState: state,
      currentTabIndexName: tabName,
    ));
  }
}
