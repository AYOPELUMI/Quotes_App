// lib/controllers/search_controller.dart
import 'package:get/get.dart';

class Searchcontroller extends GetxController {
  var quotes = <dynamic>[].obs;
  var filteredQuotes = <dynamic>[].obs;
  var searchQuery = ''.obs;
  var isLoading = true.obs;
  var isError = false.obs;


  void updateQuotes(dynamic list){
    filteredQuotes.value= list;
    update();
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
