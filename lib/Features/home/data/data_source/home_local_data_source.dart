import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatureBook({int pageNumber = 0});

  List<BookEntity> fetchNewestBook();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeatureBook({int pageNumber = 0}) {
    int startIndex = pageNumber * 10 ;
    int endIndex = (pageNumber +1)* 10 ;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;
    if(startIndex >= length || endIndex > length){
      return [];
    }
    return box.values.toList().sublist(startIndex , endIndex);
  }

  @override
  List<BookEntity> fetchNewestBook({int pageNumber = 0}) {
    int startIndex = pageNumber * 10 ;
    int endIndex = (pageNumber +1)* 10 ;
    var box = Hive.box<BookEntity>(kNewestBox);
    int length = box.values.length;
    if(startIndex >= length || endIndex > length){
      return [];
    }
    return box.values.toList();
  }
}
