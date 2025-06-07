import 'package:conference_app/core/theme/app_style.dart';
import 'package:flutter/material.dart';

Future<void> customShowDialog(BuildContext context) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder:
        (context) => AlertDialog(
          title: Text(
            'خطأ في الاتصال',
            textDirection: TextDirection.rtl,
            style: AppTextStyles.styleBold22sp(
              context,
            ).copyWith(color: Colors.red),
          ),
          content: Text(
            'لا يوجد اتصال بالإنترنت، حاول مرة أخرى.',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: AppTextStyles.styleMedium20sp(context),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('حاول مرة أخرى'),
            ),
          ],
        ),
  );
}
