// lib/models/quote_model.dart
class Quote {
  final int id;
  final String text;
  final String author;

  Quote({
    required this.id,
    required this.text,
    required this.author,
  });

  // Factory constructor to create a Quote from JSON data
  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      text: json['quote'],
      author: json['author'],
    );
  }

  // Method to convert Quote to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quote': text,
      'author': author,
    };
  }
}
