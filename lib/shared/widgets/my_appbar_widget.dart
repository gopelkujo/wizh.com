import 'package:flutter/material.dart';

class MyAppbarWidget extends StatelessWidget implements PreferredSizeWidget{
  const MyAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('data'),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}