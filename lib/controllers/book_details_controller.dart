import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nyt_best_sellers/models/book_details_model.dart';
import 'package:nyt_best_sellers/models/book_overview_model.dart';

class BookDetailsController extends GetxController
    with StateMixin<BookDetailsModel> {
  final BookOverviewModel bookOverview;

  BookDetailsController({required this.bookOverview});

  @override
  void onInit() {
    super.onInit();
    getBook();
  }

  Future<void> getBook() async {
    try {
      change(null, status: RxStatus.loading());
      final response = await Get.find<Dio>().get('/lists/full-overview.json');
      for (var result in response.data['results']['lists']) {
        if (result['list_id'] != bookOverview.listId) {
          continue;
        }
        for (var book in result['books']) {
          if ((book['primary_isbn13'] == bookOverview.isbn) ||
              (book['primary_isbn10'] == bookOverview.isbn)) {
            final bookDetail = BookDetailsModel.fromJson(book);
            change(bookDetail, status: RxStatus.success());
            break;
          }
        }
      }
    } on DioException catch (e) {
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
    if (state == null) {
      change(null, status: RxStatus.empty());
    }
  }
}
