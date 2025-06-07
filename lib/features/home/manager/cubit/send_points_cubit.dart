import 'package:conference_app/features/home/data/send_point_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'send_points_state.dart';

class SendPointsCubit extends Cubit<SendPointsState> {
  final SendPointRepo sendPointRepo;
  SendPointsCubit(this.sendPointRepo) : super(SendPointsInitial());

  Future<void> sendPoints({required String name, required int points}) async {
    try {
      emit(SendPointsLoading());
      var response = await sendPointRepo.sendBrotherPoints(name, points);
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(SendPointsSuccess());
      } else {
        emit(SendPointsFailure('فشل إرسال النقاط'));
      }
    } catch (e) {
      emit(SendPointsFailure('حدث خطأ'));
    }
  }
}
