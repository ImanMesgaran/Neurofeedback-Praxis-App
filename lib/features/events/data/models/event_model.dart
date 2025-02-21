import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
class EventModel with _$EventModel {
  const factory EventModel({
    required String id,
    required String eventTitle,
    String? eventLink,
    String? eventDescription,
    required DateTime eventDate,
    required String eventStartTime, // Keeping time as String for formatting
    required String eventEndTime,
    String? eventFlyer, // URL for flyer image
    @Default(null) DateTime? createdAt,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}
