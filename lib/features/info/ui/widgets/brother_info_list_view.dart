import 'package:conference_app/core/theme/app_style.dart';
import 'package:conference_app/core/utils/colors.dart';
import 'package:conference_app/features/info/data/model/brother/brother.info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrotherInfoListView extends StatelessWidget {
  const BrotherInfoListView({super.key, required this.brothers});
  final List<Brother> brothers;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(ColorsTheme().primaryColor),
          trackColor: WidgetStateProperty.all(Colors.grey[300]),
          thickness: WidgetStateProperty.all(8.w),
          radius: Radius.circular(10.r),
        ),
      ),
      child: Scrollbar(
        thumbVisibility: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            itemCount: brothers.length,
            itemBuilder: (context, index) {
              final brother = brothers[index];
              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(vertical: 8.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  title: Text(
                    brother.name ?? 'غير معروف',
                    style: AppTextStyles.styleBold22sp(
                      context,
                    ).copyWith(color: ColorsTheme().primaryColor),
                  ),
                  subtitle: Text(
                    'النقاط: ${brother.points ?? 0}',
                    style: AppTextStyles.styleRegular20sp(context),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
