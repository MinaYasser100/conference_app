import 'package:conference_app/core/theme/app_style.dart';
import 'package:conference_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoBodyView extends StatelessWidget {
  const InfoBodyView({super.key});

  // قايمة افتراضية تحتوي على 50 عنصر
  List<Map<String, dynamic>> get _mockData => List.generate(
    50,
    (index) => {
      'name': 'مخدوم ${index + 1}', // اسم افتراضي
      'points': (index + 1) * 10, // نقاط افتراضية
    },
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // ضمان الـ RTL
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemCount: _mockData.length,
        itemBuilder: (context, index) {
          final item = _mockData[index];
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 8.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
              title: Text(
                item['name'],
                style: AppTextStyles.styleBold22sp(
                  context,
                ).copyWith(color: ColorsTheme().primaryColor),
              ),
              subtitle: Text(
                'النقاط: ${item['points']}',
                style: AppTextStyles.styleRegular20sp(context),
              ),
            ),
          );
        },
      ),
    );
  }
}
