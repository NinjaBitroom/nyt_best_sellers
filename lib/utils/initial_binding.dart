import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:nyt_best_sellers/controllers/book_details_controller.dart';
import 'package:nyt_best_sellers/controllers/books_list_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      BaseOptions(
        baseUrl: 'https://api.nytimes.com/svc/books/v3',
        queryParameters: {'api-key': dotenv.env['API_KEY']},
      ),
    );
    Get.put(Dio(Get.find<BaseOptions>()));
    Get.put(BooksListController());
    Get.put(BookDetailsController());
  }
}
