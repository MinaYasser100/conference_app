import 'package:conference_app/core/utils/custom_overlay.dart';
import 'package:conference_app/features/home/manager/cubit/send_points_cubit.dart';
import 'package:conference_app/features/home/manager/select_point_cubit/select_point_cubit.dart';
import 'package:conference_app/features/home/model/snak_bar_model.dart';
import 'package:conference_app/features/home/ui/home_view.dart';
import 'package:conference_app/features/home/ui/widgets/custom_button.dart';
import 'package:conference_app/features/home/ui/widgets/select_points_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowNameBodyScreen extends StatelessWidget {
  const ShowNameBodyScreen({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocConsumer<SendPointsCubit, SendPointsState>(
        listener: (context, state) {
          if (state is SendPointsSuccess) {
            customOverlay(
              snakbarModel: SnakBarModel(
                context: context,
                text: 'تم إرسال النقاط بنجاح!',
                isSuccess: true,
              ),
            );
            // إصلاح التنقل
            Navigator.of(
              context,
            ).pushReplacement(MaterialPageRoute(builder: (_) => HomeView()));
          } else if (state is SendPointsFailure) {
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
                        customOverlay(
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
    );
  }
}
