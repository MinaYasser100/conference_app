part of 'select_point_cubit.dart';

@immutable
sealed class SelectPointState {}

final class SelectPointInitial extends SelectPointState {}

final class PointSelectedState extends SelectPointState {
  final int selectedPoint;

  PointSelectedState({required this.selectedPoint});
}
