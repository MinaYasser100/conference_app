import 'package:conference_app/core/theme/app_style.dart';
import 'package:conference_app/features/home/ui/widgets/custom_button.dart';
import 'package:conference_app/features/info/manager/cubit/brother_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FailureBorhterInfoWidget extends StatelessWidget {
  const FailureBorhterInfoWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            style: AppTextStyles.styleRegular20sp(context),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          CustomButton(
            text: 'إعادة المحاولة',
            onPressed: () {
              context.read<BrotherInfoCubit>().fetchBrothers();
            },
          ),
        ],
      ),
    );
  }
}
