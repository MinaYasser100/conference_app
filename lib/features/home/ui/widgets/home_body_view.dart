import 'package:conference_app/features/home/ui/widgets/custom_button.dart';
import 'package:conference_app/features/home/ui/widgets/qr_scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ZoomIn(
            duration: const Duration(seconds: 2),
            child: Image.asset('assets/images/app_logo.png'),
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: "اعطاء نقاط",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const QRScannerScreen()),
              );
            },
          ),
          const SizedBox(height: 20),
          CustomButton(text: 'بيانات المخدومين'),
        ],
      ),
    );
  }
}
