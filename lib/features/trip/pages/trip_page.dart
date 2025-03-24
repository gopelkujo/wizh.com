import 'package:flutter/material.dart';
import 'package:wizhdotcom/shared/widgets/my_appbar_widget.dart';

class TripPage extends StatelessWidget {
  const TripPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbarWidget(),
      body: SafeArea(child: Column()),
    );
  }
}