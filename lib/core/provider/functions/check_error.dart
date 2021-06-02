import 'dart:convert';

import 'package:dio/dio.dart';

import '../../core_shelf.dart';

String checkError(DioError e) {
  if (DioErrorType.receiveTimeout == e.type ||
      DioErrorType.connectTimeout == e.type) {
    return 'internet_connection'.translate;
  } else if (DioErrorType.response == e.type) {
    if (e.response.toString().contains('html')) {
      return 'temporary_problem'.translate;
    } else {
      if (jsonDecode(e.response.toString()) != null) {
        return jsonDecode(e.response.toString())['resultMessage'];
      } else {
        return 'error_occurred'.translate;
      }
    }
  } else {
    return 'internet_connection'.translate;
  }
}
