
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  final String author; // Optional: If you have an author for the quote

  QuoteCard({required this.quote, this.author = ''});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quote,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            if (author.isNotEmpty) ...[
              SizedBox(height: 8),
              Text(
                '- $author',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                textAlign: TextAlign.right,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
