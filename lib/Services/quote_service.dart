import 'package:dio/dio.dart';
import 'package:get/get.dart';

class QuoteService extends GetxService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchQuotes() async {
    final response = await _dio.get('https://dummyjson.com/quotes');
    return response.data['quotes'];
  }
}