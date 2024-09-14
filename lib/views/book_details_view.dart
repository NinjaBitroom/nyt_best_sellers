import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyt_best_sellers/controllers/book_details_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsView extends GetView<BookDetailsController> {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(state!.title),
          backgroundColor: context.theme.colorScheme.primary,
          foregroundColor: context.theme.colorScheme.onPrimary,
        ),
        body: Column(
          children: [
            Image.network(state.cover),
            Text(state.author),
            Text(state.synopsis),
            FilledButton(
              onPressed: () async {
                if (!await launchUrl(Uri.parse(state.amazonLink))) {
                  throw Exception('Could not launch $state.amazonLink');
                }
              },
              child: const Text('Comprar na Amazon'),
            ),
          ],
        ),
      );
    });
  }
}
