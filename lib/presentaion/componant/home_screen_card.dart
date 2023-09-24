import 'package:cors_project/app/app_consts.dart';
import 'package:flutter/material.dart';

import '../../app/app_colors.dart';

class HomeScreenCard extends StatelessWidget {
  final String name;
  const HomeScreenCard({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.mainColor, borderRadius: BorderRadius.circular(16)),
      child: Center(
          child: Text(
        name,
        style: const TextStyle(color: AppColors.whiteColor, fontSize: 18),
      )),
    );
  }
}
