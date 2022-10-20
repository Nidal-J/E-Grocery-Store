import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/database/controller/cart_db_controller.dart';
import 'package:e_grocery/get/controllers/cart_controller.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:e_grocery/screens/app/empty_cart.dart';
import 'package:e_grocery/utils/delete_dialog.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    //  Get.putAsync<CartController>(() => CartController().init());
    return Scaffold(
      appBar: AppBar(
        leading: const GetBackButton(),
        title: Text('cart'.tr),
      ),
      body: Obx(
        () => cartController.cartOrders.isEmpty
            ? const EmptyCart()
            : Padding(
                padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 30.h),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartController.cartOrders.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin:
                                index == (cartController.cartOrders.length - 1)
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
                                  cartController.cartOrders[index].imageUrl,
                                  height: 80,
                                  width: 80,
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartController.cartOrders[index].name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (cartController
                                                      .orderQuantity[index] !=
                                                  1) {
                                                cartController
                                                    .orderQuantity[index]--;
                                              }
                                              cartController
                                                  .calculateTotalWeight();
                                              cartController
                                                  .calculateTotalPrice();
                                            },
                                            child: Container(
                                              height: 34.w,
                                              width: 34.w,
                                              // alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                border: Border.all(
                                                    color: const Color(
                                                        0xFFD9D9D9)),
                                              ),
                                              child: const Icon(
                                                Icons.remove_rounded,
                                                color: AppColors.green,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 18.w),
                                            child: Obx(() => Text(
                                                  '${cartController.orderQuantity[index]}',
                                                  style: TextStyle(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                )),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // cartController
                                              //     .incrementOrderQuantity(
                                              //         index);
                                              cartController
                                                  .orderQuantity[index]++;
                                              cartController
                                                  .calculateTotalWeight();
                                              cartController
                                                  .calculateTotalPrice();
                                            },
                                            child: Container(
                                              height: 34.w,
                                              width: 34.w,
                                              // alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                border: Border.all(
                                                    color: const Color(
                                                        0xFFD9D9D9)),
                                              ),
                                              child: const Icon(
                                                Icons.add_rounded,
                                                color: AppColors.green,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        getDeleteDialog(
                                          onConfirm: () async {
                                            // cartController
                                            //     .orderQuantity[index] = 1;

                                            bool deleted =
                                                await CartDbController().delete(
                                                    cartController
                                                        .cartOrders[index].id);
                                            if (deleted) {
                                              cartController.cartOrders
                                                  .removeAt(index);
                                              Get.back();
                                            }
                                            cartController.orderQuantity
                                                .removeAt(index);
                                            cartController
                                                .calculateTotalPrice();
                                            cartController
                                                .calculateTotalWeight();
                                          },
                                        );
                                      },
                                      child: const Icon(
                                        Icons.delete_outline,
                                        color: AppColors.danger,
                                      ),
                                    ),
                                    Text(
                                      '${cartController.cartOrders[index].price}\$',
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'total_count'.tr,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black.withOpacity(0.7),
                          ),
                        ),
                        Text(
                          '${cartController.cartOrders.length} ${'products'.tr}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'total_weight'.tr,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black.withOpacity(0.7),
                          ),
                        ),
                        Text(
                          '${cartController.totalWeight} kg',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'total_price'.tr,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black.withOpacity(0.7),
                          ),
                        ),
                        Text(
                          '${cartController.totalPrice} \$',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        cartController.adobtQuantities();
                        Get.toNamed(AppRoutes.cartCheckout);
                      },
                      child: Text('checkout'.tr),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

      // body: Padding(
      //   padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 30.h),
      //   child: Column(
      //     children: [
      //       Expanded(
      //         child: ListView.builder(
      //           itemCount: _productPictures.length,
      //           itemBuilder: (context, index) {
      //             return Container(
      //               margin: index == (_productPictures.length - 1)
      //                   ? EdgeInsets.only(bottom: 30.h)
      //                   : EdgeInsets.only(bottom: 14.h),
      //               padding: EdgeInsetsDirectional.only(
      //                   bottom: 16.h, start: 10.w, end: 10.w),
      //               height: 102.h,
      //               decoration: const BoxDecoration(
      //                 border: Border(
      //                   bottom: BorderSide(color: Color(0xFFECECEC)),
      //                 ),
      //               ),
      //               child: Row(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Image.asset(
      //                     '${AppImages.productPath}/${_productPictures[index]}.png',
      //                     height: 80,
      //                     width: 80,
      //                   ),
      //                   SizedBox(
      //                     width: 30.w,
      //                   ),
      //                   Expanded(
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Text(
      //                           _productTitles[index],
      //                           maxLines: 1,
      //                           overflow: TextOverflow.ellipsis,
      //                           style: TextStyle(
      //                             fontSize: 16.sp,
      //                             fontWeight: FontWeight.w500,
      //                           ),
      //                         ),
      //                         Text(
      //                           '500 gm',
      //                           style: TextStyle(
      //                             fontSize: 14.sp,
      //                             fontWeight: FontWeight.w500,
      //                             color: AppColors.grey,
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: 10.h,
      //                         ),
      //                         Row(
      //                           children: [
      //                             InkWell(
      //                               onTap: () {
      //                                 storeController.decrementOrderQuantity();
      //                               },
      //                               child: Container(
      //                                 height: 34.w,
      //                                 width: 34.w,
      //                                 // alignment: Alignment.center,
      //                                 decoration: BoxDecoration(
      //                                   borderRadius:
      //                                       BorderRadius.circular(8.r),
      //                                   border: Border.all(
      //                                       color: const Color(0xFFD9D9D9)),
      //                                 ),
      //                                 child: const Icon(
      //                                   Icons.remove_rounded,
      //                                   color: AppColors.green,
      //                                 ),
      //                               ),
      //                             ),
      //                             Padding(
      //                               padding:
      //                                   EdgeInsets.symmetric(horizontal: 18.w),
      //                               child: Obx(() => Text(
      //                                     storeController.orderQuantity.value
      //                                         .toString(),
      //                                     style: TextStyle(
      //                                       fontSize: 20.sp,
      //                                       fontWeight: FontWeight.w600,
      //                                     ),
      //                                   )),
      //                             ),
      //                             InkWell(
      //                               onTap: () {
      //                                 storeController.incrementOrderQuantity();
      //                               },
      //                               child: Container(
      //                                 height: 34.w,
      //                                 width: 34.w,
      //                                 // alignment: Alignment.center,
      //                                 decoration: BoxDecoration(
      //                                   borderRadius:
      //                                       BorderRadius.circular(8.r),
      //                                   border: Border.all(
      //                                       color: const Color(0xFFD9D9D9)),
      //                                 ),
      //                                 child: const Icon(
      //                                   Icons.add_rounded,
      //                                   color: AppColors.green,
      //                                 ),
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                   // const Spacer(),
      //                   Column(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       InkWell(
      //                         onTap: () {},
      //                         child: const Icon(
      //                           Icons.delete_outline,
      //                           color: AppColors.danger,
      //                         ),
      //                       ),
      //                       Text(
      //                         '6.25\$',
      //                         style: TextStyle(
      //                           fontSize: 20.sp,
      //                           fontWeight: FontWeight.w500,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             'Total Count',
      //             style: TextStyle(
      //               fontSize: 16.sp,
      //               fontWeight: FontWeight.w500,
      //               color: AppColors.black.withOpacity(0.7),
      //             ),
      //           ),
      //           Text(
      //             _productPictures.length.toString(),
      //             style: TextStyle(
      //               fontSize: 16.sp,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ],
      //       ),
      //       SizedBox(
      //         height: 8.h,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             'Total Weight',
      //             style: TextStyle(
      //               fontSize: 16.sp,
      //               fontWeight: FontWeight.w500,
      //               color: AppColors.black.withOpacity(0.7),
      //             ),
      //           ),
      //           Text(
      //             '50 kg',
      //             style: TextStyle(
      //               fontSize: 16.sp,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ],
      //       ),
      //       SizedBox(
      //         height: 18.h,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             'Total Price',
      //             style: TextStyle(
      //               fontSize: 16.sp,
      //               fontWeight: FontWeight.w500,
      //               color: AppColors.black.withOpacity(0.7),
      //             ),
      //           ),
      //           Text(
      //             '500 \$',
      //             style: TextStyle(
      //               fontSize: 16.sp,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ],
      //       ),
      //       SizedBox(
      //         height: 30.h,
      //       ),
      //       ElevatedButton(
      //         onPressed: () {},
      //         child: const Text('Checkout'),
      //       ),
      //     ],
      //   ),
      // ),
// import 'package:e_grocery/widgets/get_back_button.dart';
// import 'package:flutter/material.dart';
// class CartScreen extends StatelessWidget {
//   const CartScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const GetBackButton(),
//         title: const Text('Cart'),
//       ),
//     );
//   }
// }
