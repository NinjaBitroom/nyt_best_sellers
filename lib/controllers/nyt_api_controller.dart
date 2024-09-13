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
    try {
      change(null, status: RxStatus.loading());
      final bestSellers = <BookOverviewModel>[];
      final response = await Get.find<Dio>().get('/lists/overview.json');
      for (var result in response.data['results']['lists']) {
        for (var book in result['books']) {
          final bookOverview = BookOverviewModel.fromJson(book);
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
