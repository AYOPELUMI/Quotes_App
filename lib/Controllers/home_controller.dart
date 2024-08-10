// lib/controllers/home_controller.dart
import 'dart:async';

import 'package:get/get.dart';
import 'package:quote_app/Services/quote_service.dart';

import 'search_controller.dart';

class HomeController extends GetxController {
  final QuoteService _quoteService = Get.find<QuoteService>();
  final Searchcontroller _controller = Get.find<Searchcontroller>();

  var quotes = <dynamic>[].obs;
  var isLoading = true.obs;
 var isError = false.obs; // Optional: Track if there's an error
  var selectedIndex = 0.obs;
  final int timeoutDuration =20;
  Future<void> changeTab(int index) async {
    selectedIndex.value = index;
    update();
  }

  @override
  void onInit() {
    fetchQuotes();
    super.onInit();
  }

    Future<void> fetchQuotes() async {
    isLoading(true);
    isError(false);
    
    // Create a Completer to manage the fetch operation
    final Completer<void> completer = Completer<void>();

    // Timer to set timeout for the fetch operation
    Timer timer = Timer(Duration(seconds: timeoutDuration), () {
      if (!completer.isCompleted) {
        completer.completeError('Request timed out');
      }
    });

    try {
      // Fetch quotes with timeout
      _quoteService.fetchQuotes().then((data) {
        if (!completer.isCompleted) {
          timer.cancel();
          quotes.value = data;
          _controller.updateQuotes(data);
          completer.complete();
        }
      }).catchError((e) {
        if (!completer.isCompleted) {
          timer.cancel();
          completer.completeError(e);
        }
      });
    } catch (e) {
      if (!completer.isCompleted) {
        timer.cancel();
        completer.completeError(e);
      }
    } finally {
      // Handle loading and error states
      completer.future.then((_) {
        isLoading(false);
      }).catchError((e) {
        isError(true);
        isLoading(false);
      });
    }
  }

  void retryFetch() {
    fetchQuotes();
  }
}