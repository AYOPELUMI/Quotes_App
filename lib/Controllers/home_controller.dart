// lib/controllers/home_controller.dart
import 'dart:async';

import 'package:get/get.dart';
import 'package:quote_app/Services/quote_service.dart';

import '../Models/quote_model.dart';

class HomeController extends GetxController {
  final QuoteService _quoteService = Get.find<QuoteService>();


  var quotes = <Quote>[].obs;
  var isLoading = true.obs;
 var isError = false.obs; // Optional: Track if there's an error
  var selectedIndex = 0.obs;
  final int timeoutDuration =20;
   late Completer<void> fetchCompleter;
  Future<void> changeTab(int index) async {
    selectedIndex.value = index;
    update();
  }

  @override
  void onInit() {
    fetchQuotes();
    super.onInit();
  }

    
    // Create a Completer to manage the fetch operat
    // Timer to set timeout for the fetch operation
  void fetchQuotesWithTimeout() {
    fetchCompleter = Completer<void>();
    fetchQuotes();
    
    // Set a timer for the fetch operation
    Timer(Duration(seconds: 10), () {
      if (!fetchCompleter.isCompleted) {
        isLoading(false);
        fetchCompleter.completeError('Fetching quotes timed out.');
      }
    });
  }

  void fetchQuotes() async {
    try {
      isLoading(true);
      var fetchedQuotes = await QuoteService().fetchQuotes();
      quotes.assignAll(fetchedQuotes);
      if (!fetchCompleter.isCompleted) {
        fetchCompleter.complete();
      }
    } catch (e) {
      if (!fetchCompleter.isCompleted) {
        fetchCompleter.completeError(e);
      }
      print(e);
    } finally {
      isLoading(false);
    }
  }

    void retryFetch () async{
    fetchQuotes();
    update();
  }
}

