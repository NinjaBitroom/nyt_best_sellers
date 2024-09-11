import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyt_best_sellers/controllers/nyt_api_controller.dart';

class HomeView extends GetView<NytApiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Livros mais lidos do New York Time'),
        backgroundColor: context.theme.colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: controller.obx(
          (state) => ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.books[index].title),
                leading: Text(state.books[index].cover),
                subtitle: Text(state.books[index].shortDescription),
                trailing: Text(state.books[index].author),
              );
            },
            itemCount: state.books.length,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.updateBooks,
        child: const Icon(Icons.restart_alt),
      ),
    );
  }
}
