import 'package:conference_app/core/utils/custom_overlay.dart';
import 'package:conference_app/features/home/model/snak_bar_model.dart';
import 'package:conference_app/features/home/ui/widgets/custom_button.dart';
import 'package:conference_app/features/info/manager/cubit/brother_info_cubit.dart';
import 'package:conference_app/features/info/ui/widgets/brother_info_list_view.dart';
import 'package:conference_app/features/info/ui/widgets/failure_bother_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoBodyView extends StatelessWidget {
  const InfoBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: RefreshIndicator(
        onRefresh: () => context.read<BrotherInfoCubit>().fetchBrothers(),
        child: BlocConsumer<BrotherInfoCubit, BrotherInfoState>(
          listener: (context, state) {
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
              return BrotherInfoListView(brothers: state.brothers);
            } else if (state is BrotherInfoFailure) {
              return FailureBorhterInfoWidget(errorMessage: state.errorMessage);
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
      ),
    );
  }
}
