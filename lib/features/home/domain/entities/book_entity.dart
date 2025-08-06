class BookEntity {
  final String bookId;
  final String? image;
  final String title;
  final String? authorName;
  final num? price;
  final num? rating;

  BookEntity({
    required this.bookId,
    this.image,
    required this.title,
    this.authorName,
    this.price,
    this.rating,
  });
}
