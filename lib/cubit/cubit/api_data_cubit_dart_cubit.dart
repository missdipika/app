import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Api/apicalldata.dart';
import '../../model/response_model.dart';

part 'api_data_cubit_dart_state.dart';

class ApiDataCubit extends Cubit<ApiDataState> {
  ApiDataCubit() : super(ApiDataInitial());
  void getdeta(String cityName) async{
    emit(ApiDataLoading());
   try {
      final ResponseModel responseModel =
          await ApiProvider().getUserData(cityName);
      emit(ApiDataLoaded(responseModel));
    }
    catch (e) {
      emit(ApiDataFailed());
      throw Exception(e);
    }
  }
}
