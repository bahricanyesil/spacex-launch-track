import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../core_shelf.dart';

class LaunchTrackProvider extends ChangeNotifier {
  final LaunchTrackService _api = LaunchTrackService();

  String errorMessage = '';

  Future<LaunchTrack?> getLastLaunch() async {
    try {
      final lastLaunch = await _api.getLastLaunch();
      return lastLaunch;
    } on DioError catch (error) {
      errorMessage = checkError(error);
    }
  }
}
