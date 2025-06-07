import 'package:conference_app/core/theme/app_style.dart';
import 'package:conference_app/core/utils/colors.dart';
import 'package:conference_app/features/home/model/snak_bar_model.dart';
import 'package:flutter/material.dart';

void customSnakBar({required SnakBarModel snakbarModel}) {
  ScaffoldMessenger.of(snakbarModel.context).showSnackBar(
    SnackBar(
      content: Text(
        snakbarModel.text,
        style: AppTextStyles.styleBold18sp(snakbarModel.context),
      ),
      backgroundColor:
          snakbarModel.isSuccess ? ColorsTheme().primaryColor : Colors.red,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      duration: const Duration(seconds: 2),
    ),
  );
}
