import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cors_project/data/requests/popular_request.dart';
import 'package:cors_project/domin/models/popular_image_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'popular_image_state.dart';

class PopularImageCubit extends Cubit<PopularImageState> {
  PopularImageCubit() : super(PopularImageInitial());

  static PopularImageCubit get(context) => BlocProvider.of(context);
  PopularImageModel popularImageModel = PopularImageModel();

  getPopularImage({required int id}) {
    emit(PopularImageLoading());
    PopularRequest.getPopularImage(
        id: id,
        onSuccess: (res) {
          popularImageModel = res;
        },
        onError: (statusCod) {
          emit(PopularImageError());
        });
  }
}
