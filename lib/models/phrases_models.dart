class PhrasesModel {
  final int id;
  final String quote;
  final String author;

  PhrasesModel({required this.id, required this.quote, required this.author});

  PhrasesModel.initial() : this(id: 0, quote: 'Yep', author: 'Me');

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quote': quote,
      'author': author,
    };
  }

  factory PhrasesModel.fromMap(Map<String, dynamic> map) {
    return PhrasesModel(
      id: map['id'] as int,
      quote: map['quote'] as String,
      author: map['author'] as String,
    );
  }
}
