part of 'brother_info_cubit.dart';

@immutable
abstract class BrotherInfoState {}

class BrotherInfoInitial extends BrotherInfoState {}

class BrotherInfoLoading extends BrotherInfoState {}

class BrotherInfoSuccess extends BrotherInfoState {
  final List<Brother> brothers;

  BrotherInfoSuccess(this.brothers);
}

class BrotherInfoFailure extends BrotherInfoState {
  final String errorMessage;

  BrotherInfoFailure(this.errorMessage);
}
