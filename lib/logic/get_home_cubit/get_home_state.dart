part of 'get_home_cubit.dart';

@freezed
class GetHomeState with _$GetHomeState {
  const factory GetHomeState.loading() = _Loading;
  const factory GetHomeState.error(String error) = _Error;
  const factory GetHomeState.success() = _Success;
}
