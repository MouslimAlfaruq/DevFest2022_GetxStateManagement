// ignore_for_file: file_names

import "package:flutter/material.dart";
import 'package:quick_widget_kit_224/quick_widget_kit_224.dart';

class ProductWidget extends StatelessWidget {
  final String? title;
  final String? date;
  final String? description;
  final String? price;
  final String? image;
  const ProductWidget({
    Key? key,
    this.title,
    this.date,
    this.description,
    this.price,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      // height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              container(
                height: 150,
                width: 130,
                isCircularRadius: true,
                circularRadius: 20,
                decorationImage: NetworkImage("$image"),
                fit: BoxFit.cover,
                color: Colors.grey.shade400,
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 40,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 180,
                    child: Text(
                      "$title",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // text(
                  //   text: "il y'a $date",
                  //   textColor: Colors.white,
                  //   fontSize: 16,
                  // ),

                  SizedBox(
                    width: 150,
                    child: Text(
                      "$description",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              text(
                text: "$price GNF",
                textColor: Colors.white,
                fontSize: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
