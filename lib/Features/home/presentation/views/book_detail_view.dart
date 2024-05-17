import 'package:booklyapp/Features/home/presentation/views/widgets/book_detail_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  BookDetailsView({
    Key? key,
    required this.image,
    required this.author,
    required this.title,
    required this.rating,
    required this.price,
  }) : super(key: key);
  String image;

  String title;
  String author;
  num rating;

  num price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BookDetailViewBody(
        image: image,
        title: title,
        author: author,
        price: price,
        rating: rating,
      )),
    );
  }
}
