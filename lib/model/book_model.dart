class BookModel {
  final String title;
  final String author;
  final String thumbnailUrl;
  final String description;

  BookModel(
      {required this.title,
      required this.author,
      required this.thumbnailUrl,
      required this.description});

  factory BookModel.fromMap(Map<String, dynamic> json) {
    return BookModel(
      title: json['volumeInfo']['title'],
      author: json['volumeInfo']['authors'][0],
      description: json['volumeInfo']['description'],
      thumbnailUrl: json['volumeInfo']['imageLinks']['smallThumbnail'],
    );
  }
}
