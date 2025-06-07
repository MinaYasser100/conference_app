import 'package:conference_app/core/internet_check/cubit/internet_check__cubit.dart';
import 'package:conference_app/features/home/data/send_point_repo.dart';
import 'package:conference_app/features/home/ui/func/custom_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'send_points_state.dart';

class SendPointsCubit extends Cubit<SendPointsState> {
  final SendPointRepo sendPointRepo;
  final BuildContext context; // لاستخدام showDialog

  SendPointsCubit(this.sendPointRepo, this.context)
    : super(SendPointsInitial());

  Future<void> sendPoints({required String name, required int points}) async {
    // فحص حالة الاتصال باستخدام ConnectivityCubit
    final connectivityState = BlocProvider.of<ConnectivityCubit>(context).state;

    if (connectivityState is! ConnectivityConnected) {
      await customShowDialog(context);
      emit(SendPointsFailure('لا يوجد اتصال بالإنترنت'));
      return;
    }

    // إذا فيه إنترنت، نفذ العملية
    try {
      emit(SendPointsLoading());
      var response = await sendPointRepo.sendBrotherPoints(name, points);
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(SendPointsSuccess());
      } else {
        emit(SendPointsFailure('فشل إرسال النقاط: ${response.statusMessage}'));
      }
    } catch (e) {
      emit(SendPointsFailure('حدث خطأ: $e'));
    }
  }
}
