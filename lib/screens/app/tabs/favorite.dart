import 'package:e_grocery/api/controllers/favorite_api_controller.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/database/controller/cart_db_controller.dart';
import 'package:e_grocery/get/controllers/product_controller.dart';
import 'package:e_grocery/models/cart.dart';
import 'package:e_grocery/models/product.dart';
import 'package:e_grocery/utils/delete_dialog.dart';
import 'package:e_grocery/widgets/shimmers/favorite_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>?>(
        future: FavoriteApiController().getFavoriteProducts(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? snapshot.data!.isEmpty
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      alignment: Alignment.center,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.grey,
                            wordSpacing: 1.2,
                            letterSpacing: 1,
                          ),
                          children: [
                            TextSpan(
                              text: 'no_favorites'.tr,
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.favorite_rounded,
                                color: AppColors.danger,
                                size: 32.r,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 0),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: index == (snapshot.data!.length - 1)
                              ? EdgeInsets.only(bottom: 30.h)
                              : EdgeInsets.only(bottom: 14.h),
                          padding: EdgeInsetsDirectional.only(
                              bottom: 16.h, start: 10.w, end: 10.w),
                          height: 102.h,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Color(0xFFECECEC)),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                snapshot.data![index].imageUrl,
                                height: 80,
                                width: 80,
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index].name,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '1 kg',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    '${snapshot.data![index].price}\$',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await _performDeletion(
                                          snapshot.data![index].id);
                                    },
                                    child: const Icon(
                                      Icons.delete_outline,
                                      color: AppColors.danger,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await _performAddToCart(
                                          snapshot.data![index]);
                                    },
                                    child: const Icon(
                                      Icons.add_shopping_cart_outlined,
                                      color: AppColors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )
              : const FavoriteShimmer();
        });
  }

  Future<void> _performDeletion(int id) async {
    getDeleteDialog(
      onConfirm: () async {
        await FavoriteApiController().postFavoriteProduct(id);
        Get.back();
        setState(() {});
      },
    );
  }

  Future<void> _performAddToCart(Product product) async {
    List<CartProduct> list = (await CartDbController().read())
        .where((cartProduct) => cartProduct.productId == product.id)
        .toList();
    if (list.isEmpty) {
      CartProduct cartProduct = CartProduct();
      cartProduct.name = product.name;
      cartProduct.imageUrl = product.imageUrl;
      cartProduct.quantity = 1;
      cartProduct.price = double.parse(product.price);
      // cartProduct.totalPrice = double.parse(product.price);
      cartProduct.productId = product.id;
      int newItemId = await CartDbController().create(cartProduct);
      if (newItemId != 0) {
        Get.snackbar(
          'add_cart'.tr,
          'add_success'.tr,
          backgroundColor: AppColors.lightGreen,
          leftBarIndicatorColor: AppColors.green,
          colorText: AppColors.black,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          // showProgressIndicator: true,
          mainButton: TextButton(
            onPressed: () async {
              bool deleted = await CartDbController().delete(newItemId);
              if (deleted) {
                Get.back();
                Get.snackbar(
                  'cancelling'.tr,
                  'remove_cart'.tr,
                  showProgressIndicator: true,
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 2),
                  // progressIndicatorController: ,
                  // progressIndicatorBackgroundColor:
                  // AppColors.green,
                );
              }
            },
            child: Text(
              'undo'.tr,
              style: const TextStyle(
                color: AppColors.green,
              ),
            ),
          ),
        );
      }
    } else {
      Get.snackbar(
        'already_added'.tr,
        'add_fail'.tr,
        backgroundColor: AppColors.lightGreen,
        leftBarIndicatorColor: AppColors.green,
        colorText: AppColors.black,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        // showProgressIndicator: true,
      );
    }
  }
}

/*
import 'package:e_grocery/api/controllers/favorite_api_controller.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/database/db_controller.dart';
import 'package:e_grocery/get/controllers/product_controller.dart';
import 'package:e_grocery/models/product.dart';
import 'package:e_grocery/utils/delete_dialog.dart';
import 'package:e_grocery/widgets/shimmers/favorite_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>?>(
        future: FavoriteApiController().getFavoriteProducts(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? snapshot.data!.isEmpty
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      alignment: Alignment.center,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.grey,
                            wordSpacing: 1.2,
                            letterSpacing: 1,
                          ),
                          children: [
                            TextSpan(
                              text: 'no_favorites'.tr,
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.favorite_rounded,
                                color: AppColors.danger,
                                size: 32.r,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 0),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: index == (snapshot.data!.length - 1)
                              ? EdgeInsets.only(bottom: 30.h)
                              : EdgeInsets.only(bottom: 14.h),
                          padding: EdgeInsetsDirectional.only(
                              bottom: 16.h, start: 10.w, end: 10.w),
                          height: 102.h,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Color(0xFFECECEC)),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                snapshot.data![index].imageUrl,
                                height: 80,
                                width: 80,
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index].name,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '1 kg',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    '${snapshot.data![index].price}\$',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await _performDeletion(
                                          snapshot.data![index].id);
                                    },
                                    child: const Icon(
                                      Icons.delete_outline,
                                      color: AppColors.danger,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // if (!productController.cartOrders
                                      //     .contains(snapshot.data![index])) {
                                      //   productController.cartOrders
                                      //       .add(snapshot.data![index]);
                                      //   productController.orderQuantity.add(1);
                                      //   productController.calculateTotalPrice();
                                      //   productController
                                      //       .calculateTotalWeight();
                                      //   Get.snackbar(
                                      //     'add_cart'.tr,
                                      //     'add_success'.tr,
                                      //     backgroundColor: AppColors.lightGreen,
                                      //     leftBarIndicatorColor:
                                      //         AppColors.green,
                                      //     colorText: AppColors.black,
                                      //     snackPosition: SnackPosition.BOTTOM,
                                      //     duration: const Duration(seconds: 2),
                                      //     // showProgressIndicator: true,
                                      //     mainButton: TextButton(
                                      //       onPressed: () {
                                      //         productController.cartOrders
                                      //             .remove(
                                      //                 snapshot.data![index]);
                                      //         Get.back();
                                      //         Get.snackbar(
                                      //           'cancelling'.tr,
                                      //           'remove_cart'.tr,
                                      //           showProgressIndicator: true,
                                      //           snackPosition:
                                      //               SnackPosition.BOTTOM,
                                      //           duration:
                                      //               const Duration(seconds: 2),
                                      //           // progressIndicatorController: ,
                                      //           // progressIndicatorBackgroundColor:
                                      //           // AppColors.green,
                                      //         );
                                      //       },
                                      //       child: Text(
                                      //         'undo'.tr,
                                      //         style: const TextStyle(
                                      //           color: AppColors.green,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   );
                                      // } else {
                                      //   Get.snackbar(
                                      //     'already_added'.tr,
                                      //     'add_fail'.tr,
                                      //     backgroundColor: AppColors.lightGreen,
                                      //     leftBarIndicatorColor:
                                      //         AppColors.green,
                                      //     colorText: AppColors.black,
                                      //     snackPosition: SnackPosition.BOTTOM,
                                      //     duration: const Duration(seconds: 2),
                                      //     // showProgressIndicator: true,
                                      //   );
                                      // }
                                    },
                                    child: const Icon(
                                      Icons.add_shopping_cart_outlined,
                                      color: AppColors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )
              : const FavoriteShimmer();
        });
  }

  Future<void> _performDeletion(int id) async {
    getDeleteDialog(
      onConfirm: () async {
        await FavoriteApiController().postFavoriteProduct(id);
        Get.back();
        setState(() {});
      },
    );
  }
}

*/