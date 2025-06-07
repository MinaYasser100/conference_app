import 'package:conference_app/core/routing/routes.dart';
import 'package:conference_app/core/theme/app_style.dart';
import 'package:conference_app/core/utils/colors.dart';
import 'package:conference_app/features/home/ui/widgets/custom_button.dart';
import 'package:conference_app/features/home/ui/widgets/qr_scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // ضمان الـ RTL
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZoomIn(
              duration: const Duration(seconds: 2),
              child: Image.asset('assets/images/app_logo.png'),
            ),
            SizedBox(height: 20.h),
            CustomButton(
              text: "اعطاء نقاط",
              onPressed: () {
                // استخدام GoRouter بدل Navigator
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const QRScannerScreen()),
                );
              },
            ),
            SizedBox(height: 20.h),
            CustomButton(
              text: 'بيانات المخدومين',
              onPressed: () {
                // التنقل إلى InfoView
                GoRouter.of(context).push(Routes.infoView);
              },
            ),
            SizedBox(height: 20),
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: Text('Made by'),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: Text(
                'Mina Yasser - 01159091340',
                style: AppTextStyles.styleBold16sp(
                  context,
                ).copyWith(color: ColorsTheme().primaryColor),
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: Text(
                'Arsany Gerges - 01206480041',
                style: AppTextStyles.styleBold16sp(
                  context,
                ).copyWith(color: ColorsTheme().primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
