import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/home/domain/usecase/fetch_newest_books_usecase.dart';
import 'package:booklyapp/Features/home/presentation/manager/newest_fetch_cubit/newest_book_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState>{
  NewestBooksCubit(this.fetchNewestBookUseCase) : super(NewestBooksInitial());

FetchNewestBookUseCase fetchNewestBookUseCase;
  Future<void> fetchNewestBooks({int pageNumber = 0}) async{
    emit(NewestBooksLoading());
   var result = await fetchNewestBookUseCase.call(pageNumber);
   result.fold((failure){
     emit(NewestBooksFailure(failure.message));
   }, (books) {
     emit(NewestBooksSuccess(books));
   });
}
}