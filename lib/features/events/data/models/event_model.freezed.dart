// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  return _EventModel.fromJson(json);
}

/// @nodoc
mixin _$EventModel {
  String get id => throw _privateConstructorUsedError;
  String get eventTitle => throw _privateConstructorUsedError;
  String? get eventLink => throw _privateConstructorUsedError;
  String? get eventDescription => throw _privateConstructorUsedError;
  DateTime get eventDate => throw _privateConstructorUsedError;
  String get eventStartTime =>
      throw _privateConstructorUsedError; // Keeping time as String for formatting
  String get eventEndTime => throw _privateConstructorUsedError;
  String? get eventFlyer =>
      throw _privateConstructorUsedError; // URL for flyer image
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this EventModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventModelCopyWith<EventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventModelCopyWith<$Res> {
  factory $EventModelCopyWith(
          EventModel value, $Res Function(EventModel) then) =
      _$EventModelCopyWithImpl<$Res, EventModel>;
  @useResult
  $Res call(
      {String id,
      String eventTitle,
      String? eventLink,
      String? eventDescription,
      DateTime eventDate,
      String eventStartTime,
      String eventEndTime,
      String? eventFlyer,
      DateTime? createdAt});
}

/// @nodoc
class _$EventModelCopyWithImpl<$Res, $Val extends EventModel>
    implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventTitle = null,
    Object? eventLink = freezed,
    Object? eventDescription = freezed,
    Object? eventDate = null,
    Object? eventStartTime = null,
    Object? eventEndTime = null,
    Object? eventFlyer = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventTitle: null == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String,
      eventLink: freezed == eventLink
          ? _value.eventLink
          : eventLink // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDescription: freezed == eventDescription
          ? _value.eventDescription
          : eventDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDate: null == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventStartTime: null == eventStartTime
          ? _value.eventStartTime
          : eventStartTime // ignore: cast_nullable_to_non_nullable
              as String,
      eventEndTime: null == eventEndTime
          ? _value.eventEndTime
          : eventEndTime // ignore: cast_nullable_to_non_nullable
              as String,
      eventFlyer: freezed == eventFlyer
          ? _value.eventFlyer
          : eventFlyer // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventModelImplCopyWith<$Res>
    implements $EventModelCopyWith<$Res> {
  factory _$$EventModelImplCopyWith(
          _$EventModelImpl value, $Res Function(_$EventModelImpl) then) =
      __$$EventModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String eventTitle,
      String? eventLink,
      String? eventDescription,
      DateTime eventDate,
      String eventStartTime,
      String eventEndTime,
      String? eventFlyer,
      DateTime? createdAt});
}

/// @nodoc
class __$$EventModelImplCopyWithImpl<$Res>
    extends _$EventModelCopyWithImpl<$Res, _$EventModelImpl>
    implements _$$EventModelImplCopyWith<$Res> {
  __$$EventModelImplCopyWithImpl(
      _$EventModelImpl _value, $Res Function(_$EventModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventTitle = null,
    Object? eventLink = freezed,
    Object? eventDescription = freezed,
    Object? eventDate = null,
    Object? eventStartTime = null,
    Object? eventEndTime = null,
    Object? eventFlyer = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$EventModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventTitle: null == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String,
      eventLink: freezed == eventLink
          ? _value.eventLink
          : eventLink // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDescription: freezed == eventDescription
          ? _value.eventDescription
          : eventDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDate: null == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventStartTime: null == eventStartTime
          ? _value.eventStartTime
          : eventStartTime // ignore: cast_nullable_to_non_nullable
              as String,
      eventEndTime: null == eventEndTime
          ? _value.eventEndTime
          : eventEndTime // ignore: cast_nullable_to_non_nullable
              as String,
      eventFlyer: freezed == eventFlyer
          ? _value.eventFlyer
          : eventFlyer // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventModelImpl implements _EventModel {
  const _$EventModelImpl(
      {required this.id,
      required this.eventTitle,
      this.eventLink,
      this.eventDescription,
      required this.eventDate,
      required this.eventStartTime,
      required this.eventEndTime,
      this.eventFlyer,
      this.createdAt = null});

  factory _$EventModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventModelImplFromJson(json);

  @override
  final String id;
  @override
  final String eventTitle;
  @override
  final String? eventLink;
  @override
  final String? eventDescription;
  @override
  final DateTime eventDate;
  @override
  final String eventStartTime;
// Keeping time as String for formatting
  @override
  final String eventEndTime;
  @override
  final String? eventFlyer;
// URL for flyer image
  @override
  @JsonKey()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'EventModel(id: $id, eventTitle: $eventTitle, eventLink: $eventLink, eventDescription: $eventDescription, eventDate: $eventDate, eventStartTime: $eventStartTime, eventEndTime: $eventEndTime, eventFlyer: $eventFlyer, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventTitle, eventTitle) ||
                other.eventTitle == eventTitle) &&
            (identical(other.eventLink, eventLink) ||
                other.eventLink == eventLink) &&
            (identical(other.eventDescription, eventDescription) ||
                other.eventDescription == eventDescription) &&
            (identical(other.eventDate, eventDate) ||
                other.eventDate == eventDate) &&
            (identical(other.eventStartTime, eventStartTime) ||
                other.eventStartTime == eventStartTime) &&
            (identical(other.eventEndTime, eventEndTime) ||
                other.eventEndTime == eventEndTime) &&
            (identical(other.eventFlyer, eventFlyer) ||
                other.eventFlyer == eventFlyer) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      eventTitle,
      eventLink,
      eventDescription,
      eventDate,
      eventStartTime,
      eventEndTime,
      eventFlyer,
      createdAt);

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      __$$EventModelImplCopyWithImpl<_$EventModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventModelImplToJson(
      this,
    );
  }
}

abstract class _EventModel implements EventModel {
  const factory _EventModel(
      {required final String id,
      required final String eventTitle,
      final String? eventLink,
      final String? eventDescription,
      required final DateTime eventDate,
      required final String eventStartTime,
      required final String eventEndTime,
      final String? eventFlyer,
      final DateTime? createdAt}) = _$EventModelImpl;

  factory _EventModel.fromJson(Map<String, dynamic> json) =
      _$EventModelImpl.fromJson;

  @override
  String get id;
  @override
  String get eventTitle;
  @override
  String? get eventLink;
  @override
  String? get eventDescription;
  @override
  DateTime get eventDate;
  @override
  String get eventStartTime; // Keeping time as String for formatting
  @override
  String get eventEndTime;
  @override
  String? get eventFlyer; // URL for flyer image
  @override
  DateTime? get createdAt;

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
