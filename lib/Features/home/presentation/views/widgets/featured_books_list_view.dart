import 'package:booklyapp/Features/home/presentation/manager/feature_fetch_cubit/fetch_fet_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/book_detail_view.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatefulWidget {
  FeaturedBooksListView({Key? key, required this.books}) : super(key: key);
  List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.23,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailsView(
                      image: widget.books[index].image!,
                      title: widget.books[index].title!,
                      author: widget.books[index].autherName!,
                      rating: widget.books[index].rating!,
                      price: widget.books[index].price!,
                    ),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookImage(image: widget.books[index].image!),
            ),
          );
        },
      ),
    );
  }
}
