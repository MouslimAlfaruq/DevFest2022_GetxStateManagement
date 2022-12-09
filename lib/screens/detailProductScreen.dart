// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_widget_kit_224/quick_widget_kit_224.dart';
import 'package:state_managment_with_getx/app/AppColors.dart';
import 'package:state_managment_with_getx/controllers/ProductController.dart';
import 'package:state_managment_with_getx/widgets/IconDetail.dart';
import 'package:state_managment_with_getx/widgets/productWidget.dart';

class DetailProductScreen extends StatefulWidget {
  final String? title;
  final String? price;
  final String? image;
  final String? description;
  const DetailProductScreen({
    Key? key,
    this.title,
    this.price,
    this.image,
    this.description,
  }) : super(key: key);

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  var productList = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: container(
                    height: 450,
                    color: Colors.white,
                    decorationImage: NetworkImage("${widget.image}"),
                    fit: BoxFit.cover,
                    isOnlyCircularRadius: true,
                    bottomRight: 80,
                  ),
                ),
                Column(
                  children: [
                    IconDetail(
                      fonction: () {},
                      icon: Icons.star,
                      color: Colors.green,
                    ),
                    IconDetail(
                      fonction: () {},
                      icon: Icons.favorite,
                      color: Colors.red,
                    ),
                    IconDetail(
                      fonction: () {},
                      icon: Icons.share,
                      color: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      "${widget.title}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  text(
                    text: "${widget.price} GNF",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: text(
                text: widget.description,
                fontSize: 16,
                fontWeight: FontWeight.w300,
                textColor: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  text(
                    text: "Produits similaires",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
            Obx(() {
              if (productList.isLoading.value == true) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.whiteColor,
                  ),
                );
              } else {
                return productList.productsList.isEmpty
                    ? Center(
                        child: text(
                          text:
                              "Aucune données trouvée, vérifié votre connexion puis réessayez",
                          textColor: AppColors.whiteColor,
                        ),
                      )
                    : SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return ProductWidget(
                              title: productList.productsList[index]["title"],
                              date: productList.productsList[index]["price"],
                              description: productList.productsList[index]
                                  ["description"],
                              image: productList.productsList[index]["image"],
                              price: productList.productsList[index]["price"],
                            );
                          },
                        ),
                      );
              }
            })
          ],
        ),
      ),
    );
  }
}
