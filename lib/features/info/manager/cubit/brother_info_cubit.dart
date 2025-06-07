import 'dart:async';
import 'package:conference_app/core/internet_check/cubit/internet_check__cubit.dart';
import 'package:conference_app/core/utils/custom_overlay.dart';
import 'package:conference_app/features/home/model/snak_bar_model.dart';
import 'package:conference_app/features/info/data/model/brother/brother.info.dart';
import 'package:conference_app/features/info/data/repo/brother_info_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'brother_info_state.dart';

class BrotherInfoCubit extends Cubit<BrotherInfoState> {
  final BrotherInfoRepo brotherInfoRepo;
  final BuildContext context;
  Timer? _internetCheckTimer;

  BrotherInfoCubit(this.brotherInfoRepo, this.context)
    : super(BrotherInfoInitial());

  Future<void> fetchBrothers() async {
    if (!context.mounted) {
      print('Context not mounted, aborting fetchBrothers');
      return;
    }

    print('Fetching brothers...');
    final connectivityState = BlocProvider.of<ConnectivityCubit>(context).state;
    print('Connectivity state: $connectivityState');

    if (connectivityState is! ConnectivityConnected) {
      print('No internet connection');
      emit(BrotherInfoFailure('لا يوجد اتصال بالإنترنت'));
      _startPeriodicInternetCheck();
      return;
    }

    try {
      emit(BrotherInfoLoading());
      final brothers = await brotherInfoRepo.getBrothers();
      print('Brothers fetched: ${brothers.length}');
      emit(BrotherInfoSuccess(brothers));
      _cancelInternetCheck();
    } catch (e) {
      print('Error fetching brothers: $e');
      emit(BrotherInfoFailure('فشل تحميل البيانات: $e'));
      if (context.mounted) {
        customOverlay(
          snakbarModel: SnakBarModel(
            context: context,
            text: 'فشل تحميل البيانات: $e',
            isSuccess: false,
          ),
        );
      }
      _startPeriodicInternetCheck();
    }
  }

  void _startPeriodicInternetCheck() {
    _cancelInternetCheck();
    print('Starting periodic internet check');
    _internetCheckTimer = Timer.periodic(const Duration(seconds: 2), (
      timer,
    ) async {
      if (!context.mounted) {
        print('Context not mounted, stopping timer');
        timer.cancel();
        return;
      }
      final connectivityState =
          BlocProvider.of<ConnectivityCubit>(context).state;
      if (connectivityState is ConnectivityConnected) {
        print('Internet connected, fetching brothers');
        await fetchBrothers();
        timer.cancel();
      }
    });
  }

  void _cancelInternetCheck() {
    _internetCheckTimer?.cancel();
    _internetCheckTimer = null;
    print('Cancelled internet check timer');
  }

  @override
  Future<void> close() {
    _cancelInternetCheck();
    return super.close();
  }
}
