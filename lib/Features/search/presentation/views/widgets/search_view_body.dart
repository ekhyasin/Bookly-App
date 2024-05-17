import 'package:booklyapp/Features/home/presentation/manager/newest_fetch_cubit/fetch_new_cubit.dart';
import 'package:booklyapp/Features/home/presentation/manager/newest_fetch_cubit/newest_book_state.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:booklyapp/Features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:booklyapp/core/utilies/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60, child: CustomTextField()),
          SizedBox(
            height: 16,
          ),
          Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(child: SearchResultListView())
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerListViewItem(
                  image: state.books[index].image!,
                  title: state.books[index].title!,
                  price: state.books[index].price!,
                  rating: state.books[index].rating!,
                  author: state.books[index].autherName!,
                ),
              );
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
      listener: (context, state) {},
    );
  }
}
