part of 'send_points_cubit.dart';

@immutable
abstract class SendPointsState {}

class SendPointsInitial extends SendPointsState {}

class SendPointsLoading extends SendPointsState {}

class SendPointsSuccess extends SendPointsState {}

class SendPointsFailure extends SendPointsState {
  final String errorMessage;

  SendPointsFailure(this.errorMessage);
}
