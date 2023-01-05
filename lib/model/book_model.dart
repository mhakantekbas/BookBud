class BookModel {
  final String? title;
  final String? author;
  final String? thumbnailUrl;
  final String? description;

  BookModel({this.title, this.author, this.thumbnailUrl, this.description});

  factory BookModel.fromMap(Map<String, dynamic> json) {
    return BookModel(
      title: json['volumeInfo']['title'] != null
          ? json['volumeInfo']['title']!
          : 'Loading...',
      author: json['volumeInfo']['authors'] != null
          ? json['volumeInfo']['authors'][0]!
          : 'Anonim',
      description: json['volumeInfo']['description'] != null
          ? json['volumeInfo']['description']!
          : 'There is no description',
      thumbnailUrl: json['volumeInfo']['imageLinks'] != null
          ? json['volumeInfo']['imageLinks']['thumbnail']!
          : 'https://images.booksense.com/images/086/681/9798749681086.jpg',
    );
  }
}
