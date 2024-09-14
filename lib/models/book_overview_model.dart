class BookOverviewModel {
  String isbn;
  int listId;
  String cover;
  String title;
  String author;
  String shortDescription;

  BookOverviewModel({
    required this.isbn,
    required this.listId,
    required this.cover,
    required this.title,
    required this.author,
    required this.shortDescription,
  });

  factory BookOverviewModel.fromJson(Map<String, dynamic> json) {
    return BookOverviewModel(
      isbn: json['isbn'].toString(),
      listId: json['list_id'],
      cover: json['cover'].toString(),
      title: json['title'].toString(),
      author: json['author'].toString(),
      shortDescription: json['short_description'].toString(),
    );
  }
}
