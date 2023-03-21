class QuoteModel {
  final String anime;
  final String character;
  final String quote;

  QuoteModel(
      {required this.anime, required this.quote, required this.character});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      anime: json['anime'],
      quote: json['quote'],
      character: json['character'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'anime': anime,
      'quote': quote,
      'character': character,
    };
  }
}
