import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/repo/home_repo.dart';
import 'package:booklyapp/core/error/failure.dart';
import 'package:dartz/dartz.dart';
abstract class UseCase <Type , Type2> {
  Future<Either<Failure,Type>> call([int pageNumber]);
}
class FetchFeatureBookUseCase extends UseCase<List<BookEntity> , int> {
  final HomeRepo homeRepo;

  FetchFeatureBookUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNumber=0 ]) async{
    //check permission
    return await homeRepo.fetchFeatureBook(pageNumber: pageNumber);
  }
}
