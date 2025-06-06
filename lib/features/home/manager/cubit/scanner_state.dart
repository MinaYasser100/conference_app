part of 'scanner_cubit.dart';

@immutable
sealed class ScannerState {}

final class ScannerInitial extends ScannerState {}

class ScannerScanning extends ScannerState {
  final bool isScanned;

  ScannerScanning({required this.isScanned});
}

class ScannerScanned extends ScannerState {
  final String name;

  ScannerScanned({required this.name});
}
