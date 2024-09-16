import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyt_best_sellers/controllers/book_details_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsView extends GetView<BookDetailsController> {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.bookOverview.title),
        backgroundColor: context.theme.colorScheme.primary,
        foregroundColor: context.theme.colorScheme.onPrimary,
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar o conteúdo: ${snapshot.error}'),
            );
          }
          return Theme(
            data: ThemeData.from(colorScheme: snapshot.data!),
            child: ListView(
              padding: const EdgeInsets.all(12.0),
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Card.filled(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child: Image.network(controller.bookOverview.cover),
                        ),
                        ListTile(
                          title: Text(
                            'Autor: ${controller.bookOverview.author}',
                          ),
                          subtitle: Text(
                            'ISBN: ${controller.bookOverview.isbn}',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Card.filled(
                    child: ListTile(
                      title: const Text('Descrição'),
                      subtitle: Text(controller.bookOverview.shortDescription),
                    ),
                  ),
                ),
                controller.obx(
                  (state) => FilledButton(
                    onPressed: () async {
                      if (!await launchUrl(Uri.parse(state!.amazonLink))) {
                        throw Exception('Could not launch $state.amazonLink');
                      }
                    },
                    child: const Text('Comprar na Amazon'),
                  ),
                ),
              ],
            ),
          );
        },
        future: ColorScheme.fromImageProvider(
          provider: NetworkImage(controller.bookOverview.cover),
          brightness: Theme.of(context).brightness,
          dynamicSchemeVariant: DynamicSchemeVariant.content,
        ),
      ),
    );
  }
}
