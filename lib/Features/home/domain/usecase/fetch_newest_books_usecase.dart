import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/repo/home_repo.dart';
import 'package:booklyapp/core/error/failure.dart';
import 'package:dartz/dartz.dart';
abstract class UseCase <Type> {
  Future<Either<Failure,Type>> call([int pageNumber]);
}
class FetchNewestBookUseCase extends UseCase<List<BookEntity>> {
  final HomeRepo homeRepo;

  FetchNewestBookUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNumber = 0]) async{
    //check permission
    return await homeRepo.fetchNewestBook(pageNumber: pageNumber);
  }
}
