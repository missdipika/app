part of 'api_data_cubit_dart_cubit.dart';

@immutable
abstract class ApiDataState {}

class ApiDataInitial extends ApiDataState {}
class ApiDataLoading extends ApiDataState {}

class ApiDataLoaded extends ApiDataState {
  final ResponseModel responseModel;
  ApiDataLoaded(this.responseModel);
}
class ApiDataFailed extends ApiDataState {}