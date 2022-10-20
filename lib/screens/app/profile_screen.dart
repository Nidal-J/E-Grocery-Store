import 'dart:developer';

import 'package:e_grocery/api/controllers/auth_api_controller.dart';
import 'package:e_grocery/api/controllers/city_api_controller.dart';
import 'package:e_grocery/constants/filters.dart';
import 'package:e_grocery/get/controllers/cities_controller.dart';
import 'package:e_grocery/get/controllers/profile_controller.dart';
import 'package:e_grocery/models/api_response.dart';
import 'package:e_grocery/utils/show_snackbar.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/widgets/register_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    final citiesController = Get.find<CitiesController>();
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: const GetBackButton(),
        title: Text('profile'.tr),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30.r),
        ),
        padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 26.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
        child: ListView(
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                alignment: AlignmentDirectional.bottomEnd,
              ),
              onPressed: () {
                if (!profileController.isEditedProfile.value) {
                  profileController.updateEditedProfile();
                }
              },
              icon: const Icon(Icons.edit_attributes_rounded),
              label: Text('edit'.tr),
            ),
            Obx(
              () => IgnorePointer(
                ignoring: !profileController.isEditedProfile.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegisterField(
                      label: 'name'.tr,
                      controller: profileController.nameController,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      'gender'.tr,
                      style: AppFonts.label,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 56.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.r),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(7.r),
                          iconEnabledColor: AppColors.black,
                          isExpanded: true,
                          value: profileController.gender.value,
                          items: [
                            DropdownMenuItem(
                              value: 'M',
                              child: Text('male'.tr),
                            ),
                            DropdownMenuItem(
                              value: 'F',
                              child: Text('female'.tr),
                            ),
                          ],
                          onChanged: (gender) {
                            profileController.gender(gender!);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      'city'.tr,
                      style: AppFonts.label,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Obx(
                      () => Container(
                        height: 56.h,
                        width: double.infinity,
                        alignment: AlignmentDirectional.centerStart,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.r),
                          border: Border.all(
                            color: profileController.cityTapped.value
                                ? AppColors.green
                                : Colors.grey,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            borderRadius: BorderRadius.circular(7.r),
                            iconEnabledColor: AppColors.black,
                            isExpanded: true,
                            value: int.parse(
                                profileController.cityId.value ?? '0'),
                            items: citiesController.listOfCities,
                            onTap: () {
                              profileController.cityTapped(true);
                            },
                            onChanged: (index) {
                              profileController.cityId(index!.toString());
                              profileController.cityTapped(false);
                            },
                          ),
                        ),
                      ),
                    ),

                    FutureBuilder<List<DropdownMenuItem<int>>?>(
                      future: CityApiController().getDropDownCitiesList(),
                      builder: (context, snapshot) {
                        return Obx(() => Container(
                              height: 56.h,
                              width: double.infinity,
                              alignment: AlignmentDirectional.centerStart,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.r),
                                border: Border.all(
                                  color: profileController.cityTapped.value
                                      ? AppColors.green
                                      : Colors.grey,
                                ),
                              ),
                              child: snapshot.hasData
                                  ? DropdownButtonHideUnderline(
                                      child: DropdownButton<int>(
                                        borderRadius:
                                            BorderRadius.circular(7.r),
                                        iconEnabledColor: AppColors.black,
                                        isExpanded: true,
                                        value: int.parse(
                                            profileController.cityId.value ??
                                                '0'),
                                        items: snapshot.data,
                                        onTap: () {
                                          profileController.cityTapped(true);
                                        },
                                        onChanged: (city) {
                                          profileController
                                              .cityId(city!.toString());
                                          profileController.cityTapped(false);
                                        },
                                      ),
                                    )
                                  : Text(
                                      'select_city'.tr,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: AppColors.grey,
                                      ),
                                    ),
                            ));
                      },
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      'birth_date'.tr,
                      style: AppFonts.label,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 56.h,
                      alignment: AlignmentDirectional.centerStart,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.r),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: InkWell(
                        onTap: () async {
                          DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: profileController.date.value,
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
                                      primary: AppColors.green,
                                      //   onPrimary: Colors.redAccent,
                                      //   onSurface: Colors.blueAccent,
                                    ),
                                  ),
                                  child: child!,
                                );
                              });

                          if (selectedDate != null) {
                            profileController.date.value = selectedDate;
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${profileController.date.value.day} - ${profileController.date.value.month} - ${profileController.date.value.year}',
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    // const RegisterField(
                    //   label: 'Password',
                    //   initialValue: 'lwqkf33433',
                    //   obscureText: true,
                    // ),
                    // SizedBox(
                    //   height: 30.h,
                    // ),
                    ColorFiltered(
                      colorFilter: profileController.isEditedProfile.value
                          ? const ColorFilter.matrix(Filters.enabled)
                          : const ColorFilter.matrix(Filters.disabled),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                log('message');
                                // Get.back();

                                ApiResponse apiResponse =
                                    await AuthApiController().updateProfile(
                                  name: profileController.nameController.text,
                                  gender: profileController.gender.value!,
                                  cityId: profileController.cityId.value!,
                                );
                                log(apiResponse.success.toString());
                                log(apiResponse.message.toString());
                                if (apiResponse.success) {
                                  Get.back();
                                }
                                showSnackbar(
                                  message: apiResponse.message,
                                  success: apiResponse.success,
                                );
                              },
                              child: Text('save'.tr),
                            ),
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                if (profileController.isEditedProfile.value) {
                                  profileController.updateEditedProfile();
                                }
                              },
                              child: Text('cancel'.tr),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
