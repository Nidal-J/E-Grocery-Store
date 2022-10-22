import 'dart:developer';
import 'package:e_grocery/api/controllers/addresses_api_controller.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/constants/filters.dart';
import 'package:e_grocery/get/controllers/store_controller.dart';
import 'package:e_grocery/models/address.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CartCheckout extends StatelessWidget {
  const CartCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeController = Get.find<StoreController>();
// storeController.isAddressLongPressed.value
//             ? IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.delete_forever),
//               )
//             :
    log(storeController.selectedAddressIndex.value.toString());

    return Scaffold(
      appBar: AppBar(
        leading: const GetBackButton(),
        title: Text('checkout'.tr),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.w),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'select_address'.tr,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.addNewAddress);
                },
                child: Text(
                  'add_new'.tr,
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
          FutureBuilder<List<Address>?>(
              future: AddressesApiController().getAddresses(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? snapshot.data!.isEmpty
                        ? TextButton.icon(
                            onPressed: () async {
                              await Get.toNamed(AppRoutes.addNewAddress);
                            },
                            icon: const Icon(Icons.add_road_rounded),
                            label: Text(
                              '  ${'add_address'.tr}',
                              style: TextStyle(
                                fontSize: 24.sp,
                              ),
                            ),
                          )
                        : ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    storeController.selectedAddressIndex.value =
                                        index;
                                  },
                                  child: Obx(
                                    () => Container(
                                      height: 120.h,
                                      width: Get.width,
                                      padding: EdgeInsets.all(15.r),
                                      decoration: BoxDecoration(
                                        color: storeController
                                                    .selectedAddressIndex
                                                    .value ==
                                                index
                                            ? AppColors.green.withOpacity(0.1)
                                            : AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                          color: storeController
                                                      .selectedAddressIndex
                                                      .value ==
                                                  index
                                              ? AppColors.green
                                              : const Color(0xFFECECEC),
                                        ),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 8.r),
                                            child: CircleAvatar(
                                              radius: 8.r,
                                              backgroundColor: storeController
                                                          .selectedAddressIndex
                                                          .value ==
                                                      index
                                                  ? AppColors.green
                                                  : const Color(0xFFECECEC),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 22.w,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.data![index].name,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '0${snapshot.data![index].contactNumber}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  snapshot.data![index].info
                                                      .replaceAll('||', ', '),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                            },
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              height: 20.h,
                            ),
                          )
                    : Shimmer.fromColors(
                        baseColor: AppColors.shimmerBaseColor,
                        highlightColor: AppColors.shimmerHighlightColor,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 95.h,
                              margin: EdgeInsets.only(bottom: 20.h),
                              decoration: BoxDecoration(
                                color: AppColors.shimmerBaseColor,
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                  color: AppColors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      );
              }),
          SizedBox(
            height: 30.h,
          ),
          Text(
            'select_payment'.tr,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Obx(() => RadioListTile(
                title: Text(
                  'cash'.tr,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                dense: true,

                contentPadding: EdgeInsets.zero,
                // selectedTileColor: AppColors.green,
                // tileColor: AppColors.green,
                activeColor: AppColors.green,
                value: 'cash',
                groupValue: storeController.paymentSystem.value,
                onChanged: (value) {
                  storeController.updatePaymentSystem('$value');
                },
              )),
          Obx(() => RadioListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                title: Text(
                  'payment_card'.tr,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                activeColor: AppColors.green,
                value: 'card',
                groupValue: storeController.paymentSystem.value,
                onChanged: (value) {
                  storeController.updatePaymentSystem('$value');
                },
              )),
          Obx(
            () => AbsorbPointer(
              absorbing: !storeController.isCardSystem.value,
              child: SizedBox(
                height: 80.h,
                child: ListView.separated(
                  // physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        storeController.selectedPaymentCardIndex.value = index;
                      },
                      child: Obx(
                        () => ColorFiltered(
                          colorFilter: storeController.isCardSystem.value
                              ? const ColorFilter.matrix(Filters.enabled)
                              : const ColorFilter.matrix(Filters.disabled),
                          child: Container(
                            width: 135.w,
                            decoration: BoxDecoration(
                              color: storeController
                                          .selectedPaymentCardIndex.value ==
                                      index
                                  ? AppColors.green.withOpacity(0.1)
                                  : AppColors.white,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                color: storeController
                                            .selectedPaymentCardIndex.value ==
                                        index
                                    ? AppColors.green
                                    : const Color(0xFFECECEC),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(index == 0
                                    ? '${AppImages.paymentCardPath}/master_card.svg'
                                    : '${AppImages.paymentCardPath}/visa.svg'),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  index == 0 ? 'Master Card' : 'Visa Card',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: 20.h,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoutes.orderSuccess);
            },
            child: Text('pay_now'.tr),
          ),
        ],
      ),
    );
  }
}
