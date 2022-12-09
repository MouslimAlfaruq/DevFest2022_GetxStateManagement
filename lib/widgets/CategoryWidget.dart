// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:quick_widget_kit_224/quick_widget_kit_224.dart';
import 'package:state_managment_with_getx/app/AppColors.dart';

class CategoryWidget extends StatelessWidget {
  final String? title;
  final String? image;

  const CategoryWidget({
    Key? key,
    this.title,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          container(
            height: 40,
            width: 40,
            isCircularRadius: true,
            circularRadius: 20,
            color: Colors.green,
            decorationImage: NetworkImage("$image"),
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 5,
          ),
          text(
            text: "$title",
            fontSize: 16,
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}