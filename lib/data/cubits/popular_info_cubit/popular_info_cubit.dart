import 'package:bloc/bloc.dart';
import 'package:cors_project/data/requests/popular_request.dart';
import 'package:cors_project/domin/models/popular_info_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'popular_info_state.dart';

class PopularInfoCubit extends Cubit<PopularInfoState> {
  PopularInfoCubit() : super(PopularInfoInitial());
  static PopularInfoCubit get(context)=>BlocProvider.of(context);
  PopularInfoModel popularInfoModel=PopularInfoModel();
   getPopularInfo({required int id})
   {
     emit(PopularInfoLoading());
    PopularRequest.getPopularInfo(id: id, onSuccess: (res)
    {
      popularInfoModel=res;
      emit(PopularInfoDone());
    }, onError: (statusCod){
      emit(PopularInfoError());
    });
   }
}
