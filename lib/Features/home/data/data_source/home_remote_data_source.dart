import 'package:booklyapp/Features/home/data/models/book_model.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/utilies/api_service.dart';
import 'package:booklyapp/core/utilies/functions/save_box.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatureBook({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBook({int pageNumber = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  ApiService apiService ;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeatureBook({int pageNumber = 0})async {
    var data = await apiService.get(endPoint: "volumes?q=computer science&startIndex=${pageNumber *10}");
    List<BookEntity> bookList = getBooksList(data);
    saveBoxData(bookList , kFeaturedBox);
    return bookList;

  }



  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> bookList =[] ;
    for(var bookItem in data['items']){
      bookList.add(BookModel.fromJson(bookItem));
    }
    return bookList;
  }

  @override
  Future<List<BookEntity>> fetchNewestBook({int pageNumber = 0}) async {
    var data = await apiService.get(endPoint: "volumes?Sorting=newest &q=computer science&startIndex=${pageNumber *6}");
    List<BookEntity> bookList = getBooksList(data);
    saveBoxData(bookList, kNewestBox);
    return bookList;
  }

}

