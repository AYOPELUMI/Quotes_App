import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/widget/quote_card.dart';

import "../Controllers/search_controller.dart";

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('    Search Quotes')),
      body: GetBuilder<Searchcontroller>(
        init: Searchcontroller(),
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (query) => controller.searchQuotes(query),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child : 
                      controller.searchText.value.isEmpty ?
             Center(child: Text('Start typing to search quotes.'))

          : controller.searchResults.isEmpty ?
             Center(child: Text('No quotes found.'))
          : ListView.builder(
                                itemCount: controller.searchResults.length,
                                itemBuilder: (context, index) {
                                  var quote = controller.searchResults[index].text;
                                  var author = controller.searchResults[index].author ?? 'Unknown'; // Handle missing author
                                  return QuoteCard(quote: quote, author: author);
                                },
                              ),
              ),
            ],
          );
        },
      ),
    );
  }
}
