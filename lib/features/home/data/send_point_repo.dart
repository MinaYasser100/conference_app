import 'package:dio/dio.dart';

abstract class SendPointRepo {
  Future<Response<dynamic>> sendBrotherPoints(String name, int points);
}
