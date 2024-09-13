import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:nyt_best_sellers/app.dart';
import 'package:nyt_best_sellers/controllers/nyt_api_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  Get.put(
    Dio(
      BaseOptions(
        baseUrl: 'https://api.nytimes.com/svc/books/v3',
        queryParameters: {
          'api-key': dotenv.env['API_KEY'],
        },
      ),
    ),
  );
  Get.put(NytApiController());
  runApp(const App());
}
