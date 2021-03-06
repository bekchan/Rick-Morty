import 'package:flutter/material.dart';
import 'package:ricknmorty/theme/color_theme.dart';

class GreenCircleLoader extends StatelessWidget {
  const GreenCircleLoader();

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: AppColors.green, backgroundColor: AppColors.blue);
  }
}
