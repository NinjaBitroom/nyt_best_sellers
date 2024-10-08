import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyt_best_sellers/controllers/book_details_controller.dart';
import 'package:nyt_best_sellers/controllers/books_list_controller.dart';
import 'package:nyt_best_sellers/views/book_details_view.dart';

class BooksListView extends GetView<BooksListController> {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Livros mais lidos do New York Time'),
        backgroundColor: context.theme.colorScheme.primary,
        foregroundColor: context.theme.colorScheme.onPrimary,
      ),
      body: controller.obx(
        (state) => ListView.builder(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 80.0),
          itemBuilder: (context, index) => Card(
            child: ListTile(
              onTap: () => Get.to(() {
                final bookDetailsController = Get.find<BookDetailsController>();
                bookDetailsController.updateBookDetails(state[index]);
                return const BookDetailsView();
              }),
              leading: Image.network(state![index].cover),
              title: Text(state[index].title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(state[index].author),
                  ),
                  Text(
                    state[index].description,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
          itemCount: state?.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.updateBooks,
        child: const Icon(Icons.restart_alt),
      ),
    );
  }
}
