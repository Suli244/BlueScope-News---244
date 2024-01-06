part of 'new_post_cubit.dart';

@freezed
class NewPostState with _$NewPostState {
  const factory NewPostState.initial() = _Initial;
  const factory NewPostState.loading() = _Loading;
  const factory NewPostState.loaded() = _Loaded;
  const factory NewPostState.error(String message) = _Error;
}
