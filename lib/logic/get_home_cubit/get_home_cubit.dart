import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_home_cubit.freezed.dart';
part 'get_home_state.dart';

class GetHomeCubit extends Cubit<GetHomeState> {
  GetHomeCubit() : super(const GetHomeState.loading());

  getData(String type) async {
    emit(const GetHomeState.loading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(const GetHomeState.success());
    } catch (e) {
      emit(GetHomeState.error(e.toString()));
    }
  }
}
