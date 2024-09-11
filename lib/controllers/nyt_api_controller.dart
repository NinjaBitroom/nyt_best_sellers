import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:nyt_best_sellers/models/book_overview_model.dart';

class NytApiController extends GetMaterialController {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.nytimes.com/svc/books/v3',
      queryParameters: {
        'api-key': dotenv.env['API_KEY'],
      },
    ),
  );
  var books = [].obs;

  @override
  void onInit() {
    super.onInit();
    updateBooks();
  }

  Future<void> updateBooks() async {
    try {
      books.clear();
      final bestSellers = [];
      final response = await _dio.get('/lists/overview.json');
      for (var result in response.data['results']['lists']) {
        for (var book in result['books']) {
          final bookOverview = BookOverviewModel(
            cover: book['book_image'].toString(),
            title: book['title'].toString(),
            author: book['author'].toString(),
            shortDescription: book['description'].toString(),
          );
          bestSellers.add(bookOverview);
        }
      }
      books.addAll(bestSellers);
    } on DioException catch (e) {
      debugPrint('Ocorreu um erro... ${e.message}');
    }
  }
}
