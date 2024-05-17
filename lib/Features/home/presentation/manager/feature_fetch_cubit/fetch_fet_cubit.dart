import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/home/domain/usecase/fetch_feature_usecase.dart';
import 'package:booklyapp/Features/home/presentation/manager/feature_fetch_cubit/features_book_state.dart';



class FeaturedBooksCubit extends Cubit<FeaturedBooksState>{
  FeaturedBooksCubit(this.fetchFeatureBookUseCase) : super(FeaturedBooksInitial());

FetchFeatureBookUseCase fetchFeatureBookUseCase;
  Future<void> fetchFeatureBooks({int pageNumber = 0}) async{
    if(pageNumber ==0){
      emit(FeaturedBooksLoading());
    }else{
      emit(FeaturedBooksPaginationLoading());
    }

   var result = await fetchFeatureBookUseCase.call(pageNumber);
   result.fold((failure){
     if(pageNumber ==0){
       emit(FeaturedBooksFailure(failure.message));

     }else{
       emit(FeaturedBooksPaginationFailure(failure.message));
     }

   }, (books) {
     emit(FeaturedBooksSuccess(books));
   });
}
}