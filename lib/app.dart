import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyt_best_sellers/utils/initial_binding.dart';
import 'package:nyt_best_sellers/views/home_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.redAccent,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.redAccent,
          brightness: Brightness.dark,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      title: 'NYT Best Sellers App',
      home: const HomeView(),
    );
  }
}
