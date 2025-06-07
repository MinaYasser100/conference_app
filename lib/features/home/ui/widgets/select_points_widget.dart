import 'package:conference_app/core/utils/colors.dart';
import 'package:conference_app/features/home/manager/select_point_cubit/select_point_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectPointsWidget extends StatelessWidget {
  const SelectPointsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectPointCubit, SelectPointState>(
      builder: (context, state) {
        int? select = state is PointSelectedState ? state.selectedPoint : null;
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _numberButton(context, 1, select),
              const SizedBox(width: 20),
              _numberButton(context, 2, select),
              const SizedBox(width: 20),
              _numberButton(context, 3, select),
            ],
          ),
        );
      },
    );
  }

  Widget _numberButton(BuildContext context, int number, int? selected) {
    final bool isSelect = number == selected;
    return ElevatedButton(
      onPressed: () {
        context.read<SelectPointCubit>().selectNumberPoint(number);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelect ? ColorsTheme().primaryColor : null,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        '$number',
        style: TextStyle(fontSize: 20, color: isSelect ? Colors.white : null),
      ),
    );
  }
}
