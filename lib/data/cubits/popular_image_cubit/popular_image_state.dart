part of 'popular_image_cubit.dart';

@immutable
abstract class PopularImageState {}

class PopularImageInitial extends PopularImageState {}
class PopularImageLoading extends PopularImageState {}
class PopularImageDone extends PopularImageState {}
class PopularImageError extends PopularImageState {}
