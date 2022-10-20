import 'package:e_grocery/api/controllers/addresses_api_controller.dart';
import 'package:e_grocery/get/controllers/store_controller.dart';
import 'package:e_grocery/models/address.dart';
import 'package:e_grocery/models/api_response.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:e_grocery/utils/delete_dialog.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({Key? key}) : super(key: key);

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  @override
  Widget build(BuildContext context) {
    final storeController = Get.find<StoreController>();
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: const GetBackButton(),
        title: Text('delivery_addresses'.tr),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30.r),
        ),
        padding: EdgeInsets.fromLTRB(20.w, 26.h, 20.w, 26.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
        child: FutureBuilder<List<Address>?>(
            future: AddressesApiController().getAddresses(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? snapshot.data!.isEmpty
                      ? Center(
                          child: TextButton.icon(
                            onPressed: () async {
                              bool isDefault =
                                  await Get.toNamed(AppRoutes.addNewAddress);
                            },
                            icon: const Icon(Icons.add_road_rounded),
                            label: Text(
                              '  ${'add_address'.tr}',
                              style: TextStyle(
                                fontSize: 24.sp,
                              ),
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Obx(() => Radio<int>(
                                                activeColor: AppColors.green,
                                                value: index,
                                                groupValue: storeController
                                                    .selectedAddressIndex.value,
                                                onChanged: (index) {
                                                  storeController
                                                      .selectedAddressIndex(
                                                          index);
                                                },
                                              )),
                                          Text(
                                            snapshot.data![index].name,
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 10.w),
                                        decoration: const BoxDecoration(
                                          border: BorderDirectional(
                                            start: BorderSide(
                                              color: AppColors.green,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'city'.tr,
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColors.grey,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    snapshot.data![index].city!
                                                        .nameEn,
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 4.h),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'address'.tr,
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColors.grey,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    snapshot.data![index].info
                                                        .split('||')[0],
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.visible,
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 4.h),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'building'.tr,
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColors.grey,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    snapshot.data![index].info
                                                        .split('||')[1],
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.visible,
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 4.h),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'flat'.tr,
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColors.grey,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    snapshot.data![index].info
                                                        .split('||')[2],
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 4.h),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'phone'.tr,
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColors.grey,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    snapshot.data![index]
                                                        .contactNumber,
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton.icon(
                                            onPressed: () async {
                                              await Get.toNamed(
                                                  AppRoutes.addNewAddress,
                                                  arguments: {
                                                    'isEdited': true,
                                                    'address':
                                                        snapshot.data![index],
                                                    'index': index,
                                                  });
                                              setState(() {});
                                            },
                                            style: TextButton.styleFrom(
                                              foregroundColor: AppColors.green,
                                            ),
                                            icon: const Icon(
                                                Icons.edit_note_rounded),
                                            label: Text('edit'.tr),
                                          ),
                                          SizedBox(
                                            width: 24.w,
                                          ),
                                          TextButton.icon(
                                            onPressed: () {
                                              getDeleteDialog(
                                                  onConfirm: () async {
                                                ApiResponse apiResponse =
                                                    await AddressesApiController()
                                                        .deleteAddress(
                                                            addressId: snapshot
                                                                .data![index]
                                                                .id);
                                                if (apiResponse.success) {
                                                  Get.back();
                                                  setState(() {});
                                                }
                                              });
                                            },
                                            style: TextButton.styleFrom(
                                              foregroundColor: AppColors.danger,
                                            ),
                                            icon: const Icon(
                                              Icons.delete_rounded,
                                              size: 20,
                                            ),
                                            label: Text('delete'.tr),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: AppColors.grey,
                                        indent: 30.w,
                                        endIndent: 30.w,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                Get.toNamed(AppRoutes.addNewAddress);
                              },
                              icon: const Icon(Icons.add_location_rounded),
                              label: Text('add_address'.tr),
                            ),
                          ],
                        )
                  : Shimmer.fromColors(
                      baseColor: AppColors.shimmerBaseColor,
                      highlightColor: AppColors.shimmerHighlightColor,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 200.h,
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
      ),
    );
  }
}
