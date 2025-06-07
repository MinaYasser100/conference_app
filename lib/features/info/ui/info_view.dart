import 'package:flutter/material.dart';

import 'widgets/info_body_view.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("بيانات المخدومين")),
      body: InfoBodyView(),
    );
  }
}
