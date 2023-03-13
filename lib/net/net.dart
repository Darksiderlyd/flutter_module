import 'package:dio/dio.dart';

class Net {

  static final Net _instance = Net._internal();

  factory Net() => _instance;

  late var dio;

  Net._internal() {
    dio = Dio();
  }



}
