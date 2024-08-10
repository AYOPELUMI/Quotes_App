
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  final String author; // Optional: If you have an author for the quote

  QuoteCard({required this.quote, this.author = ''});

  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 8,
      margin: EdgeInsets.symmetric(horizontal:34.0, vertical:14),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              quote,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
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
