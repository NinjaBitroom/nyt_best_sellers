class BookModel {
  String isbn;
  String cover;
  String title;
  String author;
  String description;
  String amazonLink;

  BookModel({
    required this.isbn,
    required this.cover,
    required this.title,
    required this.author,
    required this.description,
    required this.amazonLink,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      isbn: json['primary_isbn13'],
      cover: json['book_image'].toString(),
      title: json['title'].toString(),
      author: json['author'].toString(),
      description: json['description'].toString(),
      amazonLink: json['amazon_product_url'].toString(),
    );
  }
}
