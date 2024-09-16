import 'package:get/get.dart';
import 'package:nyt_best_sellers/models/book_model.dart';

class BookDetailsController extends GetxController with StateMixin<BookModel> {
  BookDetailsController();

  void updateBookDetails(BookModel book) {
    change(book, status: RxStatus.success());
  }
}
