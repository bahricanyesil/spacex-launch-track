import 'package:json_annotation/json_annotation.dart';

part 'launch_track.g.dart';

@JsonSerializable()
class LaunchTrack {
  String name;
  String patch;
  String wikipediaLink;
  String details;
  int flightNumber;
  DateTime launchDate;

  LaunchTrack(
    this.name,
    this.patch,
    this.wikipediaLink,
    this.details,
    this.flightNumber,
    this.launchDate,
  );

  factory LaunchTrack.fromJson(Map<String, dynamic> json) =>
      _$LaunchTrackFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchTrackToJson(this);
}
