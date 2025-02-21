// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventModelImpl _$$EventModelImplFromJson(Map<String, dynamic> json) =>
    _$EventModelImpl(
      id: json['id'] as String,
      eventTitle: json['eventTitle'] as String,
      eventLink: json['eventLink'] as String?,
      eventDescription: json['eventDescription'] as String?,
      eventDate: DateTime.parse(json['eventDate'] as String),
      eventStartTime: json['eventStartTime'] as String,
      eventEndTime: json['eventEndTime'] as String,
      eventFlyer: json['eventFlyer'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$EventModelImplToJson(_$EventModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventTitle': instance.eventTitle,
      'eventLink': instance.eventLink,
      'eventDescription': instance.eventDescription,
      'eventDate': instance.eventDate.toIso8601String(),
      'eventStartTime': instance.eventStartTime,
      'eventEndTime': instance.eventEndTime,
      'eventFlyer': instance.eventFlyer,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
