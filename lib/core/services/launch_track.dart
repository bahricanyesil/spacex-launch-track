import 'dart:convert';

import 'package:dio/dio.dart';

import '../../core/core_shelf.dart';

class LaunchTrackService {
  static final String _baseUrl = BaseService.baseText;

  Dio dio = Dio();
  String contentType = 'application/json';

  Future<LaunchTrack> getLastLaunch() async {
    try {
      final res = await dio.get('$_baseUrl');
      return LaunchTrack.fromJson(jsonDecode(res.toString()));
    } on DioError {
      rethrow;
    }
  }
}
