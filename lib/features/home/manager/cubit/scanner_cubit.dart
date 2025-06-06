import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit() : super(ScannerInitial());

  final MobileScannerController controller = MobileScannerController();

  void startScanning() {
    emit(ScannerScanning(isScanned: false));
  }

  void onDetect(BarcodeCapture capture, BuildContext context) {
    final currentState = state;
    if (currentState is ScannerScanning && currentState.isScanned) return;

    final barcode = capture.barcodes.first;
    final String? name = barcode.rawValue;

    if (name != null) {
      emit(ScannerScanned(name: name));
      controller.stop(); // Stop the camera after a successful scan
    }
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
