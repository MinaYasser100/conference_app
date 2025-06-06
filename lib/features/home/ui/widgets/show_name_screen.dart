import 'package:conference_app/features/home/manager/select_point_cubit/select_point_cubit.dart';
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
    return BlocProvider(
      create: (context) => SelectPointCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text("اسم المخدوم")),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // الاسم في المنتصف
              Center(
                child: Text(
                  "الاسم: $name",
                  style: GoogleFonts.cairo(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SelectPointsWidget(),
              CustomButton(text: 'Send', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
