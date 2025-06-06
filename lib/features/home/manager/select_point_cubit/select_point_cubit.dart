import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'select_point_state.dart';

class SelectPointCubit extends Cubit<SelectPointState> {
  SelectPointCubit() : super(SelectPointInitial());

  void selectNumberPoint(int number) {
    emit(PointSelectedState(selectedPoint: number));
  }
}
