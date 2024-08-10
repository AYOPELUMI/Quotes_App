import 'package:dio/dio.dart';

import '../Models/quote_model.dart';

class QuoteService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://dummyjson.com/quotes';

  Future<List<Quote>> fetchQuotes() async {
    try {
      final response = await _dio.get(baseUrl);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['quotes'];
        return data.map((quoteJson) => Quote.fromJson(quoteJson)).toList();
      } else {
        throw Exception('Failed to load quotes');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load quotes');
    }
  }
}