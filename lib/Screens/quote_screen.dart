// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/Controllers/home_controller.dart';

import '../Widget/quote_card.dart';

class QuoteScreen extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('    Quotes')),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          if (controller.isLoading.value) {
            return Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children:[
                CircularProgressIndicator(),
                SizedBox(height:10),

                Text('Please wait while fetching quotes')]));
          }

          if (controller.isError.value) {

            return Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text('Error fetching quotes'),
                SizedBox(height:10),
                ElevatedButton(onPressed:() { controller.retryFetch();}, child: const Text("Try again"))]));
          }

          return ListView.builder(
            itemCount: controller.quotes.length,
            itemBuilder: (context, index) {
              var quote = controller.quotes[index].text;
              var author = controller.quotes[index].author ?? " "; // Optional: Adjust based on your data
              return QuoteCard(
                quote: quote,
                author: author,
              );
            },
          );
        },
      ),
    );
  }
}