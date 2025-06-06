import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_check__state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(ConnectivityInitial()) {
    _checkInitialConnectivity();
    _monitorConnectivityChanges();
  }

  ConnectivityResult? _lastConnectivityResult;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  /// للتحقق من الاتصال عند بدء التطبيق
  Future<void> _checkInitialConnectivity() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      await _handleConnectivityChange([connectivityResult.first]);
    } catch (e) {
      emit(ConnectivityDisconnected());
      log('Error during initial connectivity check: $e');
    }
  }

  /// مراقبة تغييرات الاتصال مع تقليل عدد الإشعارات باستخدام debounce
  void _monitorConnectivityChanges() {
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) async {
      await _handleConnectivityChange(result);
    });
  }

  /// التحقق من الاتصال الفعلي بالإنترنت
  Future<bool> _isInternetAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      log('Error checking internet availability: $e');
      return false;
    }
  }

  /// التعامل مع التغيرات في حالة الاتصال
  Future<void> _handleConnectivityChange(
      List<ConnectivityResult> connectivityResults) async {
    // التحقق إذا كانت هناك أي نتيجة جديدة في قائمة النتائج
    final connectivityResult = connectivityResults.isNotEmpty
        ? connectivityResults.first
        : ConnectivityResult.none;

    if (connectivityResult != _lastConnectivityResult) {
      _lastConnectivityResult = connectivityResult;

      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        final isInternetAvailable = await _isInternetAvailable();
        if (isInternetAvailable) {
          emit(ConnectivityConnected());
          log('Connectivity: Connected with internet');
        } else {
          emit(ConnectivityDisconnected());
          log('Connectivity: Connected but no internet');
        }
      } else {
        emit(ConnectivityDisconnected());
        log('Connectivity: Disconnected');
      }
    }
  }

  /// إلغاء الاشتراك عند التخلص من الكائن
  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
