import 'package:hive_flutter/hive_flutter.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0) //create adapter book entity
class BookEntity {
  @HiveField(0)
  final String? bookId;
  @HiveField(1)
  final String ?image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String ?autherName;
  @HiveField(4)
  final num ?price;
  @HiveField(5)
  final num ?rating;

  BookEntity(
      {required this.image,
      required this.title,
      required this.autherName,
      required this.price,
      required this.rating,
      required this.bookId});
}
