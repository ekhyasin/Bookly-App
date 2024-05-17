import 'package:booklyapp/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_app_bar_details.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:booklyapp/core/utilies/styles.dart';
import 'package:booklyapp/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookDetailViewBody extends StatelessWidget {
  BookDetailViewBody({
    Key? key,
    required this.image,
    required this.title,
    required this.author,
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
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomAppBarBookDetails(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .2),
                  child: CustomBookImage(
                    image: image,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    author,
                    style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                BookRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                  rating: rating,
                ),
                const SizedBox(
                  height: 37,
                ),
                ButtonAction(price: price),
                const Expanded(
                  child: SizedBox(
                    height: 49,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You can also like',
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SimilarBooksListView(
                  ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ButtonAction extends StatelessWidget {
  ButtonAction({super.key, required this.price});

  num price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomButton(
                backgroundColor: Colors.white,
                textColor: Colors.black,
                text: '${price}€',
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ))),
        Expanded(
            child: CustomButton(
                backgroundColor: const Color(0XFFEF8262),
                textColor: Colors.white,
                text: 'Free preview',
                fontSize: 16,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ))),
      ],
    );
  }
}
