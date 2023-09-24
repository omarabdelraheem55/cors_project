part of 'popular_info_cubit.dart';

@immutable
abstract class PopularInfoState {}

class PopularInfoInitial extends PopularInfoState {}
class PopularInfoLoading extends PopularInfoState {}
class PopularInfoDone extends PopularInfoState {}
class PopularInfoError extends PopularInfoState {}
