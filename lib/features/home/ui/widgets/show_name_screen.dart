import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowNameScreen extends StatelessWidget {
  final String name;
  const ShowNameScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("اسم المخدوم")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // الاسم في المنتصف
          Center(
            child: Text(
              "الاسم: $name",
              style: GoogleFonts.cairo(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _numberButton(context, 1),
                const SizedBox(width: 20),
                _numberButton(context, 2),
                const SizedBox(width: 20),
                _numberButton(context, 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _numberButton(BuildContext context, int number) {
    return ElevatedButton(
      onPressed: () {
        // نفذ الإجراء المطلوب هنا
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('تم اختيار الرقم $number')));
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text('$number', style: const TextStyle(fontSize: 20)),
    );
  }
}
