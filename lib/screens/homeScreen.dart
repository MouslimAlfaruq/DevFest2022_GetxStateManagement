// ignore_for_file: file_names

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_widget_kit_224/quick_widget_kit_224.dart';
import 'package:state_managment_with_getx/app/AppColors.dart';
import 'package:state_managment_with_getx/controllers/CategoryController.dart';
import 'package:state_managment_with_getx/controllers/ProductController.dart';
import 'package:state_managment_with_getx/screens/detailProductScreen.dart';
import 'package:state_managment_with_getx/widgets/CategoryWidget.dart';
import 'package:state_managment_with_getx/widgets/Header.dart';
import 'package:state_managment_with_getx/widgets/productWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var productList = Get.find<ProductsController>();
  var categoryList = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.blackColor,
              pinned: true,
              expandedHeight: 150,
              flexibleSpace: const FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Black Market',
                  style: TextStyle(
                      // fontSize: 25,
                      ),
                ),

                background: Header(
                  image: "assets/diobs.jpg",
                ),
                // title: ,
              ),
            ),
            SliverToBoxAdapter(child: Obx(
              () {
                if (categoryList.isLoading.value == true) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 50,
                    child: categoryList.categoryList.isEmpty
                        ? Center(
                            child: text(
                              text:
                                  "Aucune données trouvée, vérifié votre connexion puis réessayez",
                              textColor: AppColors.whiteColor,
                            ),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categoryList.categoryList.length,
                            itemBuilder: (context, index) {
                              return CategoryWidget(
                                title: categoryList.categoryList[index]["nom"],
                                image: categoryList.categoryList[index]
                                    ["image"],
                              );
                            },
                          ),
                  );
                }
              },
            )),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: text(
                  text: "Produits",
                  textColor: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Obx(() {
              if (productList.isLoading.value == true) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.whiteColor,
                    ),
                  ),
                );
              } else if (productList.productsList.isEmpty) {
                return Center(
                  child: text(
                    text:
                        "Aucune données trouvée, vérifié votre connexion puis réessayez",
                    textColor: AppColors.whiteColor,
                  ),
                );
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return OpenContainer(
                        openColor: Colors.black,
                        closedColor: Colors.black,
                        middleColor: Colors.grey.shade600,
                        transitionType: ContainerTransitionType.fadeThrough,
                        transitionDuration: const Duration(milliseconds: 600),
                        closedBuilder: (context, _) => ProductWidget(
                          title: productList.productsList[index]["title"],
                          date: productList.productsList[index]["price"],
                          description: productList.productsList[index]
                              ["description"],
                          image: productList.productsList[index]["image"],
                          price: productList.productsList[index]["price"],
                        ),
                        openBuilder: (context, _) => DetailProductScreen(
                          title: productList.productsList[index]["title"],
                          price: productList.productsList[index]["price"],
                          image: productList.productsList[index]["image"],
                          description: productList.productsList[index]["description"],
                        ),
                      );
                    },
                    childCount: productList.productsList.length,
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
