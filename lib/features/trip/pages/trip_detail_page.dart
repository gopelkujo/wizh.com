import 'package:flutter/material.dart';
import 'package:wizhdotcom/shared/widgets/my_appbar_widget.dart';

class TripDetailPage extends StatelessWidget {
  /// Trip data id for gets trip detail.
  final String id;
  
  const TripDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbarWidget(),
      body: SafeArea(child: Container()),
    );
  }
}