import 'package:conference_app/core/theme/app_style.dart';
import 'package:conference_app/core/utils/colors.dart';
import 'package:conference_app/features/home/model/snak_bar_model.dart';
import 'package:flutter/material.dart';

void customOverlay({required SnakBarModel snakbarModel}) {
  final overlay = Overlay.of(snakbarModel.context);
  final overlayEntry = OverlayEntry(
    builder:
        (context) => Positioned(
          top: 100, // ظهور في أعلى الشاشة
          left: 10.0,
          right: 10.0,
          child: Material(
            elevation: 8.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color:
                    snakbarModel.isSuccess
                        ? ColorsTheme().primaryColor
                        : Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                snakbarModel.text,
                style: AppTextStyles.styleBold18sp(
                  context,
                ).copyWith(color: ColorsTheme().whiteColor),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
  );

  // إضافة الـ OverlayEntry إلى الـ Overlay
  overlay.insert(overlayEntry);

  // إزالة الـ OverlayEntry بعد 3 ثوان
  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
