import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nyt_best_sellers/models/book_overview_model.dart';

class NytApiController extends GetxController
    with StateMixin<List<BookOverviewModel>> {
  @override
  void onInit() {
    super.onInit();
    updateBooks();
  }

  Future<void> updateBooks() async {
    change(null, status: RxStatus.loading());
    try {
      final bestSellers = <BookOverviewModel>[];
      final response = await Get.find<Dio>().get('/lists/overview.json');
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
      change(bestSellers, status: RxStatus.success());
    } on DioException catch (e) {
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
