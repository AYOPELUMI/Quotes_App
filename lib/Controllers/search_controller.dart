
import 'package:get/get.dart';

import '../Models/quote_model.dart';
import 'home_controller.dart';

class Searchcontroller extends GetxController {
  var searchResults = <Quote>[].obs;
  var searchText = ''.obs;

  HomeController homeController = Get.find<HomeController>();

  void searchQuotes(String query) {
    searchText.value = query;
    if (query.isEmpty) {
      searchResults.clear();
    } else {
      searchResults.value = homeController.quotes
          .where((quote) =>
              quote.text.toLowerCase().contains(query.toLowerCase()) ||
              quote.author.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    update();
  }
}
