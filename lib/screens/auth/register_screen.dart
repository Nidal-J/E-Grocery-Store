import 'package:e_grocery/api/controllers/auth_api_controller.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/get/controllers/cities_controller.dart';
import 'package:e_grocery/get/controllers/auth/register_controller.dart';
import 'package:e_grocery/models/api_response.dart';
import 'package:e_grocery/models/user.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:e_grocery/utils/show_snackbar.dart';
import 'package:e_grocery/widgets/register_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  // late final TextEditingController nameController;
  // late final TextEditingController phoneController;
  // late final TextEditingController passwordController;

  // final _formKey = GlobalKey<FormState>();
  // bool _passwordVisible = false;
  // String gender = 'M';
  // bool genderTapped = false;
  // bool cityTapped = false;
  // int cityId = 1;

  // @override
  // void initState() {
  //   nameController = TextEditingController();
  //   phoneController = TextEditingController();
  //   passwordController = TextEditingController();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   nameController.dispose();
  //   phoneController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }
  // final registerController = Get.find<registerController>();
  final registerController = Get.find<RegisterController>();
  final citiesController = Get.find<CitiesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: Form(
          key: registerController.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.w, 65.h, 0, 32.h),
                  child: Text(
                    'register_greeting'.tr,
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  padding: EdgeInsets.fromLTRB(20.w, 32.h, 20.w, 32.h),
                  margin: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RegisterField(
                        label: 'name'.tr,
                        controller: registerController.nameController,
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      RegisterField(
                        label: 'phone_number'.tr,
                        isPhoneNumber: true,
                        controller: registerController.phoneController,
                      ),
                      // Text(
                      //   'phone_number'.tr,
                      //   style: AppFonts.label,
                      // ),
                      // SizedBox(
                      //   height: 10.h,
                      // ),
                      // TextFormField(
                      //   controller: registerController.phoneController,
                      //   validator: (value) {
                      //     if (value == null || value.trim().isEmpty) {
                      //       return 'required_error_message'.tr;
                      //     } else if (value.length != 9) {
                      //       return 'phone_length_error_message'.tr;
                      //     }
                      //     return null;
                      //   },
                      //   maxLength: 9,
                      //   textInputAction: TextInputAction.next,
                      //   keyboardType: TextInputType.phone,
                      //   style: const TextStyle(
                      //     letterSpacing: 1.2,
                      //   ),
                      //   decoration: InputDecoration(
                      //     contentPadding: EdgeInsets.symmetric(
                      //         horizontal: 12.w, vertical: 12.h),
                      //     prefix: Container(
                      //       height: 32.h,
                      //       width: 60.w,
                      //       alignment: Alignment.center,
                      //       padding: EdgeInsetsDirectional.only(end: 8.w),
                      //       margin: EdgeInsetsDirectional.only(end: 12.w),
                      //       decoration: const BoxDecoration(
                      //         border: BorderDirectional(
                      //           end: BorderSide(
                      //               width: 1, color: AppColors.green),
                      //         ),
                      //       ),
                      //       child: const Text('+970'),
                      //     ),
                      //     counterText: '',
                      //     // hintText: '59xxxxxxx',
                      //     // fillColor: AppColors.lightGrey,
                      //     // filled: true,
                      //     // isDense: true,
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(7),
                      //       borderSide: const BorderSide(
                      //         color: Color(0xFFE0E0E0),
                      //       ),
                      //     ),
                      //     focusedBorder: const OutlineInputBorder(
                      //       borderSide: BorderSide(
                      //         color: AppColors.green,
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      // RegisterField(
                      //   label: 'Phone Number',
                      //   controller: phoneController,
                      //   textInputType: TextInputType.phone,
                      //   condition: phoneController.text.length == 9,
                      //   message: 'Mobile number must be 9 digits!',
                      //   prefix: Container(
                      //     height: 56.h,
                      //     width: 60.w,
                      //     alignment: Alignment.center,
                      //     padding: EdgeInsetsDirectional.only(end: 8.w),
                      //     margin: EdgeInsetsDirectional.only(end: 12.w),
                      //     decoration: const BoxDecoration(
                      //       border: BorderDirectional(
                      //         end: BorderSide(
                      //           width: 2,
                      //           color: AppColors.lightGrey,
                      //         ),
                      //       ),
                      //     ),
                      //     child: const Text('+970'),
                      //   ),
                      // ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Text(
                        'gender'.tr,
                        style: AppFonts.label,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 60.h,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.r),
                          border: Border.all(
                            color: registerController.genderTapped.value
                                ? AppColors.green
                                : Colors.grey,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                            child: Obx(
                          () => DropdownButton<String>(
                            borderRadius: BorderRadius.circular(7.r),
                            iconEnabledColor: AppColors.black,
                            isExpanded: true,
                            value: registerController.gender.value,
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
                            onTap: () {
                              registerController.genderTapped(true);
                              registerController.cityTapped(false);
                            },
                            onChanged: (gender) {
                              registerController.gender(gender!);
                              registerController.genderTapped(false);
                            },
                          ),
                        )),
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
                      Obx(
                        () => Container(
                          height: 56.h,
                          width: double.infinity,
                          alignment: AlignmentDirectional.centerStart,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            border: Border.all(
                              color: registerController.cityTapped.value
                                  ? AppColors.green
                                  : Colors.grey,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              borderRadius: BorderRadius.circular(7.r),
                              iconEnabledColor: AppColors.black,
                              isExpanded: true,
                              value: registerController.cityId.value,
                              items: citiesController.listOfCities,
                              onTap: () {
                                registerController.cityTapped(true);
                                registerController.genderTapped(false);
                              },
                              onChanged: (index) {
                                registerController.cityId(index!);
                                registerController.cityTapped(false);
                              },
                            ),
                          ),
                        ),
                      ),
                      // FutureBuilder<List<DropdownMenuItem<int>>?>(
                      //     future: CityApiController().getDropDownCitiesList(),
                      //     builder: (context, snapshot) {
                      //       return Container(
                      //         height: 56.h,
                      //         width: double.infinity,
                      //         alignment: AlignmentDirectional.centerStart,
                      //         padding: EdgeInsets.symmetric(horizontal: 16.w),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(7.r),
                      //           border: Border.all(
                      //             color: registerController.cityTapped.value
                      //                 ? AppColors.green
                      //                 : Colors.grey,
                      //           ),
                      //         ),
                      //         child: snapshot.hasData
                      //             ? DropdownButtonHideUnderline(
                      //                 child: DropdownButton<int>(
                      //                   borderRadius:
                      //                       BorderRadius.circular(7.r),
                      //                   iconEnabledColor: AppColors.black,
                      //                   isExpanded: true,
                      //                   value: registerController.cityId.value,
                      //                   items: snapshot.data,
                      //                   onTap: () {
                      //                     registerController.cityTapped(true);
                      //                     registerController.genderTapped(false);
                      //                   },
                      //                   // items: [
                      //                   //   DropdownMenuItem<int>(
                      //                   //     value: snapshot.data![0].id,
                      //                   //     child:
                      //                   //         Text(snapshot.data![0].nameEn),
                      //                   //   ),
                      //                   //   DropdownMenuItem<int>(
                      //                   //     value: snapshot.data![1].id,
                      //                   //     child:
                      //                   //         Text(snapshot.data![1].nameEn),
                      //                   //   ),
                      //                   //   DropdownMenuItem<int>(
                      //                   //     value: snapshot.data![2].id,
                      //                   //     child:
                      //                   //         Text(snapshot.data![2].nameEn),
                      //                   //   ),
                      //                   //   DropdownMenuItem<int>(
                      //                   //     value: snapshot.data![3].id,
                      //                   //     child:
                      //                   //         Text(snapshot.data![3].nameEn),
                      //                   //   ),
                      //                   //   DropdownMenuItem<int>(
                      //                   //     value: snapshot.data![4].id,
                      //                   //     child:
                      //                   //         Text(snapshot.data![4].nameEn),
                      //                   //   ),
                      //                   //   DropdownMenuItem<int>(
                      //                   //     value: snapshot.data![5].id,
                      //                   //     child:
                      //                   //         Text(snapshot.data![5].nameEn),
                      //                   //   ),
                      //                   //   DropdownMenuItem<int>(
                      //                   //     value: snapshot.data![6].id,
                      //                   //     child:
                      //                   //         Text(snapshot.data![6].nameEn),
                      //                   //   ),
                      //                   //   DropdownMenuItem<int>(
                      //                   //     value: snapshot.data![7].id,
                      //                   //     child:
                      //                   //         Text(snapshot.data![7].nameEn),
                      //                   //   ),
                      //                   //   DropdownMenuItem<int>(
                      //                   //     value: snapshot.data![8].id,
                      //                   //     child:
                      //                   //         Text(snapshot.data![8].nameEn),
                      //                   //   ),
                      //                   //   DropdownMenuItem<int>(
                      //                   //     value: snapshot.data![9].id,
                      //                   //     child:
                      //                   //         Text(snapshot.data![9].nameEn),
                      //                   //   ),
                      //                   //   DropdownMenuItem<int>(
                      //                   //     value: snapshot.data![10].id,
                      //                   //     child:
                      //                   //         Text(snapshot.data![10].nameEn),
                      //                   //   ),
                      //                   // ],
                      //                   onChanged: (city) {
                      //                     registerController.cityId(city!);
                      //                     registerController.cityTapped(false);
                      //                   },
                      //                 ),
                      //               )
                      //             : const Text(
                      //                 'Select City',
                      //                 style: TextStyle(
                      //                   fontSize: 16,
                      //                   color: AppColors.grey,
                      //                 ),
                      //               ),
                      //       );
                      //     }),
                      SizedBox(
                        height: 26.h,
                      ),
                      Obx(
                        () => RegisterField(
                          label: 'password'.tr,
                          controller: registerController.passwordController,
                          isPassword: true,
                          textInputAction: TextInputAction.done,
                          obscureText: registerController.passwordVisible.value,
                          suffixIcon: IconButton(
                            onPressed: () {
                              registerController.passwordVisible(
                                  registerController.passwordVisible.value);
                            },
                            icon: registerController.passwordVisible.value
                                ? const Icon(
                                    Icons.visibility,
                                    color: AppColors.green,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: AppColors.grey,
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'sign_up'.tr,
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (registerController.formKey.currentState!
                                  .validate()) {
                                await _performRegister();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(80.w, 56.h),
                            ),
                            child: Icon(Get.locale == const Locale('en')
                                ? Icons.east_rounded
                                : Icons.west_rounded),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'already_have_account'.tr,
                            style: const TextStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.offAllNamed(AppRoutes.loginScreen);
                            },
                            child: Text(
                              'login'.tr,
                              style: const TextStyle(
                                color: AppColors.green,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _performRegister() async {
    ApiResponse apiResponse = await AuthApiController().register(user: user);

    if (apiResponse.success) {
      Get.toNamed(AppRoutes.verificationScreen);
      showSnackbar(
        title: 'welcome'.tr,
        message: apiResponse.message,
        duration: 6,
      );
    } else {
      showSnackbar(
        message: apiResponse.message,
        success: false,
      );
    }
  }

  User get user {
    User user = User();
    user.name = registerController.nameController.text;
    user.mobile = registerController.phoneController.text;
    user.password = registerController.passwordController.text;
    user.gender = registerController.gender.value;
    user.cityId = registerController.cityId.value.toString();
    return user;
  }
}
