import 'package:booklyapp/core/utilies/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  BookRating(
      {Key? key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.rating})
      : super(key: key);

  MainAxisAlignment mainAxisAlignment;

  num rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0XFFFFDD4F),
        ),
        const SizedBox(
          width: 6.3,
        ),
         Text(
         rating.toString(),
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 9,
        ),
        Opacity(
          opacity: 0.5,
          child: Text('(2390)',
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}
