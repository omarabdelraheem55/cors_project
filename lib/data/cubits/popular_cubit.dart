import 'package:bloc/bloc.dart';
import 'package:cors_project/data/requests/popular_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../domin/models/popular_model.dart';
part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());
  static  PopularCubit get(context)=>BlocProvider.of(context);
  List<Results> PopularList=[];
  getPopular(){
    emit(PopularLoading());
    PopularRequest.getPopular(onSuccess: (res){
      PopularList=res!;
      emit(PopularDone());
    }, onError: (statusCode){
      emit(PopularError());
    });
  }
}
