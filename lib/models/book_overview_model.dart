class BookOverviewModel {
  String cover;
  String title;
  String author;
  String shortDescription;

  BookOverviewModel({
    required this.cover,
    required this.title,
    required this.author,
    required this.shortDescription,
  });

  factory BookOverviewModel.fromJson(Map<String, dynamic> json) {
    return BookOverviewModel(
      cover: json['book_image'].toString(),
      title: json['title'].toString(),
      author: json['author'].toString(),
      shortDescription: json['description'].toString(),
    );
  }
}
