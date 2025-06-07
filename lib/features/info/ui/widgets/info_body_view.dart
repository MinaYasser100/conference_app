import 'package:conference_app/core/theme/app_style.dart';
import 'package:conference_app/core/utils/colors.dart';
import 'package:conference_app/core/utils/custom_overlay.dart';
import 'package:conference_app/features/home/model/snak_bar_model.dart';
import 'package:conference_app/features/home/ui/widgets/custom_button.dart';
import 'package:conference_app/features/info/manager/cubit/brother_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoBodyView extends StatelessWidget {
  const InfoBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<BrotherInfoCubit, BrotherInfoState>(
        listener: (context, state) {
          print('Bloc state: $state');
          if (state is BrotherInfoFailure) {
            customOverlay(
              snakbarModel: SnakBarModel(
                context: context,
                text: state.errorMessage,
                isSuccess: false,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is BrotherInfoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BrotherInfoSuccess) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              itemCount: state.brothers.length,
              itemBuilder: (context, index) {
                final brother = state.brothers[index];
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
            );
          } else if (state is BrotherInfoFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errorMessage,
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
          return Center(
            child: CustomButton(
              text: 'تحميل البيانات',
              onPressed: () {
                context.read<BrotherInfoCubit>().fetchBrothers();
              },
            ),
          );
        },
      ),
    );
  }
}
