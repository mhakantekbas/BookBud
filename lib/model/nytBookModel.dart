class NytBookModel {
  final String title;


  NytBookModel(
      {required this.title,});

  factory NytBookModel.fromMap(Map<dynamic, dynamic> json) {
    return NytBookModel(
      title: json['title'],
    );
  }
}