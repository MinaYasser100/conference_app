import 'package:conference_app/core/dependency_injection/setup_locator.dart';
import 'package:conference_app/features/home/data/send_points_repo_impl.dart';
import 'package:conference_app/features/home/manager/cubit/send_points_cubit.dart';
import 'package:conference_app/features/home/manager/select_point_cubit/select_point_cubit.dart';
import 'package:conference_app/features/home/ui/widgets/show_name_body_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowNameScreen extends StatelessWidget {
  final String name;
  const ShowNameScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SelectPointCubit()),
        BlocProvider(
          create: (context) => SendPointsCubit(locator<SendPointsRepoImpl>()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text("اسم المخدوم")),
        body: ShowNameBodyScreen(name: name),
      ),
    );
  }
}
