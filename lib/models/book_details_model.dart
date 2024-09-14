class BookDetailsModel {
  String cover;
  String title;
  String author;
  String synopsis;
  String amazonLink;

  BookDetailsModel({
    required this.cover,
    required this.title,
    required this.author,
    required this.synopsis,
    required this.amazonLink,
  });

  factory BookDetailsModel.fromJson(Map<String, dynamic> json) {
    return BookDetailsModel(
      cover: json['book_image'].toString(),
      title: json['title'].toString(),
      author: json['author'].toString(),
      synopsis: json['description'].toString(),
      amazonLink: json['amazon_product_url'].toString(),
    );
  }
}
