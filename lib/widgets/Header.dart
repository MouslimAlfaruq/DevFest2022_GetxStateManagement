import "package:flutter/material.dart";
import 'package:quick_widget_kit_224/quick_widget_kit_224.dart';
import 'package:state_managment_with_getx/app/AppColors.dart';

class Header extends StatelessWidget {
  final String? image;
  const Header({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return container(
        height: 100,
        width: double.infinity,
        isCircularRadius: true,
        circularRadius: 20,
        decorationImage: AssetImage("$image"),
        // fit: BoxFit.cover,
        borderColor: AppColors.whiteColor,
        isPaddingAll: true,
        paddingAll: 20,
        color : AppColors.whiteColor,
    );
  }
}