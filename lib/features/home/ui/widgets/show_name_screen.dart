import 'package:conference_app/core/helper_network/dio/dio_helper.dart';
import 'package:conference_app/core/theme/app_style.dart';
import 'package:conference_app/core/utils/colors.dart';
import 'package:conference_app/core/utils/custom_snak_bar.dart';
import 'package:conference_app/features/home/data/send_points_repo_impl.dart';
import 'package:conference_app/features/home/manager/cubit/send_points_cubit.dart';
import 'package:conference_app/features/home/manager/select_point_cubit/select_point_cubit.dart';
import 'package:conference_app/features/home/model/snak_bar_model.dart';
import 'package:conference_app/features/home/ui/widgets/custom_button.dart';
import 'package:conference_app/features/home/ui/widgets/select_points_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowNameScreen extends StatelessWidget {
  final String name;
  const ShowNameScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SelectPointCubit()),
        BlocProvider(
          create:
              (context) =>
                  SendPointsCubit(SendPointsRepoImpl(dioHelper: DioHelper())),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text("اسم المخدوم")),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocConsumer<SendPointsCubit, SendPointsState>(
            listener: (context, state) {
              if (state is SendPointsSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'تم إرسال النقاط بنجاح!',
                      style: AppTextStyles.styleBold18sp(context),
                    ),
                    backgroundColor: ColorsTheme().primaryColor,
                    behavior: SnackBarBehavior.floating,
                    margin: const EdgeInsets.only(
                      top: 50.0,
                      left: 10.0,
                      right: 10.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    duration: const Duration(seconds: 3),
                  ),
                );
              } else if (state is SendPointsFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.errorMessage,
                      style: AppTextStyles.styleBold18sp(context),
                    ),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                    margin: const EdgeInsets.only(
                      top: 50.0,
                      left: 10.0,
                      right: 10.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    duration: const Duration(seconds: 3),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "الاسم: $name",
                      style: GoogleFonts.cairo(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SelectPointsWidget(),
                  const SizedBox(height: 20),
                  state is SendPointsLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                        text: 'Send',
                        onPressed: () {
                          final selectPointState =
                              context.read<SelectPointCubit>().state;
                          if (selectPointState is PointSelectedState) {
                            context.read<SendPointsCubit>().sendPoints(
                              name: name,
                              points: selectPointState.selectedPoint,
                            );
                          } else {
                            customSnakBar(
                              snakbarModel: SnakBarModel(
                                context: context,
                                text: 'يرجى اختيار عدد النقاط أولاً',
                                isSuccess: false,
                              ),
                            );
                          }
                        },
                      ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
