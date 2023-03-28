import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class UtilitiesService {
  var logger = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );
  final dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: true,
    ));

  int _count = 0;

  get count => _count;

  set count(count) {
    _count = count;
  }
}
