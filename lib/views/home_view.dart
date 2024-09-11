import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyt_best_sellers/controllers/nyt_api_controller.dart';

class HomeView extends GetView<NytApiController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Livros mais lidos do New York Time'),
        backgroundColor: context.theme.colorScheme.primary,
        foregroundColor: context.theme.colorScheme.onPrimary,
      ),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 80.0),
          itemBuilder: (context, index) => Card(
            child: ListTile(
              leading: Image.network(controller.books[index].cover),
              title: Text(controller.books[index].title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(controller.books[index].author),
                  ),
                  Text(controller.books[index].shortDescription),
                ],
              ),
            ),
          ),
          itemCount: controller.books.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.updateBooks,
        child: const Icon(Icons.restart_alt),
      ),
    );
  }
}
