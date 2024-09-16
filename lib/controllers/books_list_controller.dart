import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nyt_best_sellers/models/book_model.dart';

class BooksListController extends GetxController
    with StateMixin<List<BookModel>> {
  @override
  void onInit() {
    super.onInit();
    updateBooks();
  }

  Future<void> updateBooks() async {
    try {
      change(null, status: RxStatus.loading());
      final bestSellers = <BookModel>[];
      final response = await Get.find<Dio>().get('/lists/overview.json');
      for (var result in response.data['results']['lists']) {
        for (var book in result['books']) {
          final bookOverview = BookModel.fromJson(book);
          bestSellers.add(bookOverview);
        }
      }
      return change(bestSellers, status: RxStatus.success());
    } on DioException catch (e) {
      return change(null, status: RxStatus.error(e.message));
    } catch (e) {
      return change(null, status: RxStatus.error(e.toString()));
    }
  }
}
