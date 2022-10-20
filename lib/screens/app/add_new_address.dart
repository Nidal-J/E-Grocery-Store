import 'dart:developer';

import 'package:e_grocery/api/controllers/addresses_api_controller.dart';
import 'package:e_grocery/api/controllers/city_api_controller.dart';
import 'package:e_grocery/get/controllers/store_controller.dart';
import 'package:e_grocery/models/address.dart';
import 'package:e_grocery/models/api_response.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/widgets/register_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final _formKey = GlobalKey<FormState>();
  final storeController = Get.find<StoreController>();
  final isEdited = Get.arguments?['isEdited'] ?? false;
  final Address? _oldAddress = Get.arguments?['address'];
  Address? get oldAddress => _oldAddress;
  bool cityTapped = false;

  int cityId = Get.arguments?['address']?.cityId ?? 1;
  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController detailsController;
  late final TextEditingController buildingController;
  late final TextEditingController flatController;
  @override
  void initState() {
    nameController = TextEditingController(text: oldAddress?.name);
    phoneController = TextEditingController(text: oldAddress?.contactNumber);
    detailsController =
        TextEditingController(text: oldAddress?.info.split('||')[0]);
    buildingController =
        TextEditingController(text: oldAddress?.info.split('||')[1]);
    flatController =
        TextEditingController(text: oldAddress?.info.split('||')[2]);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    detailsController.dispose();
    buildingController.dispose();
    flatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: const GetBackButton(),
        title: Text(isEdited ? 'edit_address'.tr : 'add_address'.tr),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                padding: EdgeInsets.fromLTRB(20.w, 36.h, 20.w, 36.h),
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegisterField(
                      label: 'address_name'.tr,
                      controller: nameController,
                      // initialValue: oldAddress?.name,
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      'city'.tr,
                      style: AppFonts.label,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    FutureBuilder<List<DropdownMenuItem<int>>?>(
                        future: CityApiController().getDropDownCitiesList(),
                        builder: (context, snapshot) {
                          return Container(
                            height: 56.h,
                            width: double.infinity,
                            alignment: AlignmentDirectional.centerStart,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              border: Border.all(
                                color:
                                    cityTapped ? AppColors.green : Colors.grey,
                              ),
                            ),
                            child: snapshot.hasData
                                ? DropdownButtonHideUnderline(
                                    child: DropdownButton<int>(
                                      borderRadius: BorderRadius.circular(7.r),
                                      iconEnabledColor: AppColors.black,
                                      isExpanded: true,
                                      value: cityId,
                                      items: snapshot.data,
                                      onTap: () {
                                        cityTapped = true;

                                        setState(() {});
                                      },
                                      onChanged: (city) {
                                        setState(
                                          () {
                                            cityId = city!;
                                            cityTapped = false;
                                          },
                                        );
                                      },
                                    ),
                                  )
                                : const Text(
                                    'Select City',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.grey,
                                    ),
                                  ),
                          );
                        }),

                    SizedBox(
                      height: 26.h,
                    ),
                    RegisterField(
                      label: 'address_details'.tr,
                      controller: detailsController,
                      maxLines: 2,
                      // initialValue: oldAddress?.info.split('||')[0],
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    RegisterField(
                      label: 'building_num'.tr,
                      controller: buildingController,
                      // initialValue: oldAddress?.info.split('||')[1],
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    RegisterField(
                      label: 'flat_num'.tr,
                      controller: flatController,
                      // initialValue: oldAddress?.info.split('||')[2],
                    ),
                    RegisterField(
                      label: 'phone_number'.tr,
                      controller: phoneController,
                      isPhoneNumber: true,
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    // Row(
                    //   children: [
                    //     const Expanded(
                    //       child: RegisterField(label: 'State'),
                    //     ),
                    //     SizedBox(
                    //       width: 26.w,
                    //     ),
                    //     const Expanded(
                    //       child: RegisterField(label: 'ZIP code'),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 26.h,
                    // ),
                    Obx(() => CheckboxListTile(
                          value: storeController.isDefaultAddress.value,
                          activeColor: AppColors.green,
                          title: Text(
                            'default_address'.tr,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onChanged: (checked) {
                            storeController.isDefaultAddress(checked);
                          },
                        )),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (isEdited) {
                            await _performEditAddress();
                          } else {
                            await _performNewAddress();
                          }
                        }
                      },
                      child: Text('save_address'.tr),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _performNewAddress() async {
    log('message');
    ApiResponse apiResponse =
        await AddressesApiController().createAddress(address: address);
    log(apiResponse.success.toString());
    if (apiResponse.success) {
      Get.back();
    }
  }

  Future<void> _performEditAddress() async {
    _address.id = oldAddress!.id;
    ApiResponse apiResponse =
        await AddressesApiController().updateAddress(address: address);
    if (apiResponse.success) {
      if (storeController.isDefaultAddress.value) {
        storeController.selectedAddressIndex(Get.arguments?['index']);
        log(storeController.selectedAddressIndex.value.toString());
      }
      Get.back();
    }
  }

  final Address _address = Address();
  Address get address {
    _address.name = nameController.text;
    _address.info =
        '${detailsController.text}||${buildingController.text}||${flatController.text}';
    _address.contactNumber = phoneController.text;
    _address.cityId = cityId;
    return _address;
  }
}
