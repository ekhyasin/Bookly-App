import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookEntity>>> fetchFeatureBook({int pageNumber = 0});
  Future<Either<Failure,List<BookEntity>>> fetchNewestBook({int pageNumber = 0});
}