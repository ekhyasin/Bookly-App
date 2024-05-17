import 'package:booklyapp/Features/home/presentation/manager/feature_fetch_cubit/fetch_fet_cubit.dart';
import 'package:booklyapp/Features/home/presentation/manager/newest_fetch_cubit/fetch_new_cubit.dart';
import 'package:booklyapp/Features/home/presentation/manager/newest_fetch_cubit/newest_book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'best_seller_item.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  late ScrollController _scrollController;
  var nextPage = 1;
  var isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener()async {
    if (_scrollController.position.pixels >=
        0.7 * _scrollController.position.maxScrollExtent) {
      if(!isLoading){
        isLoading=true;
        await  BlocProvider.of<FeaturedBooksCubit>(context).fetchFeatureBooks(
          pageNumber: nextPage++,
        );
        isLoading=false;
      }


    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is NewestBooksSuccess) {
            return ListView.builder(
              controller: _scrollController,
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
        });
  }
}

/*BlocProvider(
      child:
        },

      ) ,
        create: (context) {

  },
    );*/
