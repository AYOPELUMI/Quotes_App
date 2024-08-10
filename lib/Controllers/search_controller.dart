// lib/controllers/search_controller.dart
import 'package:get/get.dart';

import 'home_controller.dart';

class Searchcontroller extends GetxController {
  final HomeController _controller = Get.find<HomeController>();
  var quotes = <dynamic>[].obs;
  var filteredQuotes = <dynamic>[].obs;
  var searchQuery = ''.obs;
  var isLoading = true.obs;
  var isError = false.obs;

  @override
  void onInit() {
    quotes.value= _controller.quotes;
    super.onInit();
  }


  void updateSearchQuery(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredQuotes.value = quotes;
    } else {
      filteredQuotes.value = quotes
          .where((quote) => quote['quote'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
