import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/widget/quote_card.dart';

import "../Controllers/search_controller.dart";

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Quotes')),
      body: GetBuilder<Searchcontroller>(
        init: Searchcontroller(),
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (query) => controller.updateSearchQuery(query),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : controller.isError.value
                        ? Center(child: Text('Error fetching quotes'))
                        : controller.filteredQuotes.isEmpty
                            ? Center(child: Text('No quotes found'))
                            : ListView.builder(
                                itemCount: controller.filteredQuotes.length,
                                itemBuilder: (context, index) {
                                  var quote = controller.filteredQuotes[index]['quote'];
                                  var author = controller.filteredQuotes[index]['author'] ?? 'Unknown'; // Handle missing author
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
