import 'package:booklyapp/Features/home/presentation/manager/newest_fetch_cubit/fetch_new_cubit.dart';
import 'package:booklyapp/Features/home/presentation/manager/newest_fetch_cubit/newest_book_state.dart';
import 'package:booklyapp/Features/home/presentation/views/book_detail_view.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  SimilarBooksListView({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailsView(
                            image: state.books[index].image!,
                            title: state.books[index].title!,
                            author: state.books[index].autherName!,
                            rating: state.books[index].rating!,
                            price: state.books[index].price!,
                          ),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomBookImage(
                      image: state.books[index].image!,
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
      listener: (context, state) {},
    );
  }
} /**/
