// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchTrack _$LaunchTrackFromJson(Map<String, dynamic> json) {
  return LaunchTrack(
    json['name'],
    json['links']['patch']['large'],
    json['links']['wikipedia'],
    json['details'],
    json['flight_number'],
    DateTime.parse(json['date_local']),
  );
}

Map<String, dynamic> _$LaunchTrackToJson(LaunchTrack instance) =>
    <String, dynamic>{
      'name': instance.name,
      'patch': instance.patch,
      'wikipedia': instance.wikipediaLink,
      'details': instance.details,
      'flight_number': instance.flightNumber,
      'launch_date': instance.launchDate
    };
