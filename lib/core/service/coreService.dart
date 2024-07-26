import 'package:dio/dio.dart';

abstract class CoreService {
  static Dio dio = Dio();
  static late Response responsee;
  static late Stream<Response> res;
}
