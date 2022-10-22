import 'package:e_grocery/api/controllers/categories_api_controller.dart';
import 'package:e_grocery/api/controllers/favorite_api_controller.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/database/controller/cart_db_controller.dart';
import 'package:e_grocery/get/controllers/product_controller.dart';
import 'package:e_grocery/models/api_response.dart';
import 'package:e_grocery/models/cart.dart';
import 'package:e_grocery/models/product.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:e_grocery/widgets/no_data.dart';
import 'package:e_grocery/widgets/shimmers/product_details_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String appBarTitle =
      '${Get.arguments?['product_name']} ${'details'.tr}'.toTitleCase();
  int productId = Get.arguments?['product_id'] ?? -1;
  final productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GetBackButton(),
        title: Text(appBarTitle),
        backgroundColor: AppColors.white,
        elevation: 1,
        shadowColor: const Color(0xFFECECEC),
      ),
      body: FutureBuilder<Product?>(
        future: CategoriesApiController().getProductDetails(productId),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? snapshot.data != null
                  ? ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            SizedBox(
                              height: 350.h,
                              child: PageView.builder(
                                itemCount: snapshot.data!.images.length,
                                onPageChanged: (index) {
                                  productController.updateProductIndex(index);
                                },
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 30.h),
                                    padding: EdgeInsets.all(20.r),
                                    child: Image.network(
                                      snapshot.data!.images[index].imageUrl,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned.directional(
                              textDirection: TextDirection.ltr,
                              top: 46.h,
                              end: 32.w,
                              child: InkWell(
                                onTap: () async {
                                  await FavoriteApiController()
                                      .postFavoriteProduct(snapshot.data!.id);
                                  setState(() {});
                                },
                                child: CircleAvatar(
                                  backgroundColor: AppColors.white,
                                  radius: 24.r,
                                  child: Icon(
                                    snapshot.data!.isFavorite
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_border_rounded,
                                    color: snapshot.data!.isFavorite
                                        ? AppColors.danger
                                        : AppColors.black,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 24.h,
                              child: Obx(
                                () => Row(
                                  children: [
                                    Container(
                                      height: 5.h,
                                      width: productController
                                                  .productIndex.value ==
                                              0
                                          ? 18.w
                                          : 10.w,
                                      decoration: BoxDecoration(
                                        color: productController
                                                    .productIndex.value ==
                                                0
                                            ? AppColors.green
                                            : const Color(0xFF9FC5A6),
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Container(
                                      height: 5.h,
                                      width: productController
                                                  .productIndex.value ==
                                              1
                                          ? 18.w
                                          : 10.w,
                                      decoration: BoxDecoration(
                                        color: productController
                                                    .productIndex.value ==
                                                1
                                            ? AppColors.green
                                            : const Color(0xFF9FC5A6),
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(16.w),
                                      height: 5.h,
                                      width: productController
                                                  .productIndex.value ==
                                              2
                                          ? 18.w
                                          : 10.w,
                                      decoration: BoxDecoration(
                                        color: productController
                                                    .productIndex.value ==
                                                2
                                            ? AppColors.green
                                            : const Color(0xFF9FC5A6),
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 30.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    snapshot.data!.name.toTitleCase(),
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    '(',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      // color: AppColors.grey,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star_rounded,
                                    color: Colors.amber,
                                    size: 18.r,
                                  ),
                                  Text(
                                    ' ${double.parse(snapshot.data!.overalRate).toStringAsFixed(1)} )',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      // color: AppColors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                '${'weight'.tr}1kg',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                '${'quantity'.tr}${snapshot.data!.quantity}',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Row(
                                children: [
                                  Visibility(
                                    visible: snapshot.data!.offerPrice != null,
                                    child: Text(
                                      '\$${snapshot.data!.offerPrice}',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Text(
                                    '\$${snapshot.data!.price}',
                                    style: TextStyle(
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.green,
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      if (productController
                                              .productQuantity.value !=
                                          1) {
                                        productController
                                            .productQuantity.value--;
                                      }
                                    },
                                    child: Container(
                                      height: 34.w,
                                      width: 34.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                            color: const Color(0xFFD9D9D9)),
                                      ),
                                      child: const Icon(
                                        Icons.remove_rounded,
                                        color: AppColors.green,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 18.w),
                                    child: Obx(() => Text(
                                          productController.productQuantity
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (productController
                                              .productQuantity.value !=
                                          int.parse(snapshot.data!.quantity)) {
                                        productController
                                            .productQuantity.value++;
                                      }
                                    },
                                    child: Container(
                                      height: 34.w,
                                      width: 34.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                            color: const Color(0xFFD9D9D9)),
                                      ),
                                      child: const Icon(
                                        Icons.add_rounded,
                                        color: AppColors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                'product_details'.tr,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Text(
                                snapshot.data!.info,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.grey,
                                ),
                              ),
                              Divider(
                                height: 25.h,
                                thickness: 1,
                                color: const Color(0xFFECECEC),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'review'.tr,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  RatingBarIndicator(
                                    rating: snapshot.data!.productRate == 0
                                        ? 0.0
                                        : double.parse(
                                            snapshot.data!.productRate),
                                    itemSize: 20,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star_rounded,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // double temp =
                                      //     productController.userRating.value;
                                      Get.defaultDialog(
                                        titlePadding:
                                            EdgeInsets.only(top: 24.h),
                                        contentPadding:
                                            EdgeInsets.only(top: 24.h),
                                        radius: 10.r,
                                        titleStyle: TextStyle(
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        title: 'rate_product'.tr,
                                        content: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Obx(
                                                  () => Text(
                                                    '${productController.userRating.value}',
                                                    style: TextStyle(
                                                      color: Colors.amber,
                                                      fontSize: 24.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  ' / 5',
                                                  style: TextStyle(
                                                    color: AppColors.grey,
                                                    fontSize: 24.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            RatingBar.builder(
                                              glowColor: AppColors.green
                                                  .withOpacity(0.5),
                                              unratedColor: AppColors.grey,
                                              initialRating: productController
                                                  .userRating.value,
                                              itemBuilder: (context, index) =>
                                                  const Icon(
                                                Icons.star_rate_rounded,
                                                color: Colors.amber,
                                              ),
                                              allowHalfRating: true,
                                              updateOnDrag: true,
                                              onRatingUpdate: (rating) {
                                                productController
                                                    .updateUserRating(rating);
                                              },
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Text('cancel'.tr),
                                          ),
                                          SizedBox(
                                            width: 30.w,
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              ApiResponse apiResponse =
                                                  await CategoriesApiController()
                                                      .rateProducts(
                                                productId: snapshot.data!.id,
                                                rate: productController
                                                    .userRating.value,
                                              );

                                              if (apiResponse.success) {
                                                Get.back(result: 'ok');
                                                setState(() {});
                                              }
                                            },
                                            child: Text('ok'.tr),
                                          ),
                                        ],
                                      );
                                      // ).then((value) => value == 'ok'
                                      //     ? null
                                      //     : productController
                                      //         .updateUserRating(temp));
                                    },
                                    child: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 25.h,
                                thickness: 1,
                                color: const Color(0xFFECECEC),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      // if (!productController.cartOrders
                                      //     .contains(snapshot.data!)) {
                                      //   productController.cartOrders
                                      //       .add(snapshot.data!);
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
                                      //             .remove(snapshot.data!);
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
                                      //   );
                                      // }
                                      await _performAddToCart(snapshot.data!);
                                    },
                                    child: Container(
                                      height: 56.h,
                                      width: 56.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                            color: const Color(0xFFD9D9D9)),
                                      ),
                                      child: const Icon(
                                        Icons.add_shopping_cart,
                                        // color: AppColors.green,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Get.toNamed(AppRoutes.cartCheckout);
                                      },
                                      child: Text('buy_now'.tr),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : const NoData()
              : const ProductDetailsShimmer();
        },
      ),
    );
  }

  Future<void> _performAddToCart(Product product) async {
    print('Add To Cart1');
    List<CartProduct> list = (await CartDbController().read())
        .where((cartProduct) => cartProduct.productId == product.id)
        .toList();
    CartProduct cartProduct = CartProduct();
    cartProduct.name = product.name;
    cartProduct.imageUrl = product.imageUrl;
    cartProduct.quantity = productController.productQuantity.value;
    cartProduct.price = double.parse(product.price);
    // cartProduct.totalPrice =
    // double.parse(product.price) * productController.productQuantity.value;
    cartProduct.productId = product.id;
    print('Add To Cart2');
    if (list.isEmpty) {
      print('Add Cart');

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
      if (list.first.quantity == productController.productQuantity.value) {
        print('Already exist');
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
      } else {
        print('Update Cart');
        cartProduct.id = list.first.id;
        cartProduct.quantity = productController.productQuantity.value;
        print(productController.productQuantity.value);
        print(cartProduct.id);
        bool updated = await CartDbController().update(cartProduct);
        if (updated) {
          Get.snackbar(
            'cart_updated'.tr,
            'updated_succes'.tr,
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
  }
}
