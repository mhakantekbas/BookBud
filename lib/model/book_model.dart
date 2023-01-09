class BookModel {
  final String? title;
  final String? author;
  final String? thumbnailUrl;
  final String? description;
  final String? categories;
  final String? publishdate;
  final String? publisher;
  final String? isbn;
  final String? isbntype;
  final int? page;
  final String? language;
  String? taskid;

  BookModel(
      {this.title,
      this.author,
      this.thumbnailUrl,
      this.description,
      this.categories,
      this.publishdate,
      this.publisher,
      this.isbn,
      this.page,
      this.language,
      this.isbntype,
      this.taskid});

  factory BookModel.fromMap(Map<String, dynamic> json) {
    return BookModel(
      title: json['volumeInfo']['title'] != null
          ? json['volumeInfo']['title']!
          : 'Loading...',
      author: json['volumeInfo']['authors'] != null
          ? json['volumeInfo']['authors'][0]!
          : 'anonymous',
      description: json['volumeInfo']['description'] != null
          ? json['volumeInfo']['description']!
          : 'There is no description',
      thumbnailUrl: json['volumeInfo']['imageLinks'] != null
          ? json['volumeInfo']['imageLinks']['thumbnail']!
          : 'https://upload.wikimedia.org/wikipedia/commons/0/0a/No-image-available.png',
      categories: json['volumeInfo']['categories'] != null
          ? json['volumeInfo']['categories'][0]!
          : 'No Data...',
      publishdate: json['volumeInfo']['publishedDate'] != null
          ? json['volumeInfo']['publishedDate']!
          : 'No Data...',
      publisher: json['volumeInfo']['publisher'] != null
          ? json['volumeInfo']['publisher']!
          : 'No Data...',
      isbn: json['volumeInfo']['industryIdentifiers'] != null
          ? json['volumeInfo']['industryIdentifiers'][0]["identifier"]!
          : 'No Data...',
      isbntype: json['volumeInfo']['industryIdentifiers'] != null
          ? json['volumeInfo']['industryIdentifiers'][0]["type"]!
          : 'No Data...',
      page: json['volumeInfo']['pageCount'] != null
          ? json['volumeInfo']['pageCount']!
          : 'No Data...',
      language: json['volumeInfo']['language'] != null
          ? json['volumeInfo']['language']!
          : 'No Data...',
    );
  }
}
