import 'package:conference_app/core/dependency_injection/setup_locator.dart';
import 'package:conference_app/core/theme/app_style.dart';
import 'package:conference_app/features/info/data/repo/brother_info_repo_impl.dart';
import 'package:conference_app/features/info/manager/cubit/brother_info_cubit.dart';
import 'package:conference_app/features/info/ui/widgets/info_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'بيانات المخدومين',
            style: AppTextStyles.styleBold22sp(context),
          ),
        ),
        body: BlocProvider(
          create:
              (context) =>
                  BrotherInfoCubit(locator<BrotherInfoRepoImpl>(), context),
          child: Builder(
            builder: (context) {
              // استدعاء fetchBrothers باستخدام context من داخل BlocProvider
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.read<BrotherInfoCubit>().fetchBrothers();
              });
              return const InfoBodyView();
            },
          ),
        ),
      ),
    );
  }
}
