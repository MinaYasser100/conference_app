import 'package:conference_app/features/home/ui/widgets/home_body_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UCAN')),
      body: HomeBodyView(),
    );
  }
}
