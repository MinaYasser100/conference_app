import 'package:conference_app/features/home/manager/scanner_cubit/scanner_cubit.dart';
import 'package:conference_app/features/home/ui/widgets/show_name_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerScreen extends StatelessWidget {
  const QRScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScannerCubit()..startScanning(),
      child: BlocListener<ScannerCubit, ScannerState>(
        listener: (context, state) {
          if (state is ScannerScanned) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => ShowNameScreen(name: state.name),
              ),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Scan QR Code')),
          body: BlocBuilder<ScannerCubit, ScannerState>(
            builder: (context, state) {
              final cubit = context.read<ScannerCubit>();
              return MobileScanner(
                controller: cubit.controller,
                onDetect: (capture) {
                  cubit.onDetect(capture, context);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
