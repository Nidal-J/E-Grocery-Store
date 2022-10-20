import 'package:e_grocery/api/controllers/auth_api_controller.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/get/controllers/auth/forget_controller.dart';
import 'package:e_grocery/models/api_response.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:e_grocery/screens/auth/login_screen.dart';
import 'package:e_grocery/utils/show_snackbar.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:e_grocery/widgets/register_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetPassword extends GetView<ForgetController> {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.phoneController.text = Get.arguments?['phone'] ?? '';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        leading: const GetBackButton(),
        title: Text('forget_password'.tr),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(30.r),
            ),
            padding: EdgeInsets.fromLTRB(20.w, 70.h, 20.w, 40.h),
            margin: EdgeInsets.fromLTRB(16.w, 30.h, 16.w, 30.h),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'reset_password'.tr,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'forget_opening_sentence'.tr,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  RegisterField(
                    label: '',
                    isPhoneNumber: true,
                    controller: controller.phoneController,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        controller.isSendingCode(true);
                        await _performReset();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(Get.width, 56.h),
                    ),
                    child: Text('send_code'.tr),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.isSendingCode.value,
              child: const LoadingWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _performReset() async {
    ApiResponse apiResponse = await AuthApiController()
        .forgetPassword(phoneNumber: controller.phoneController.text);
    controller.isSendingCode(false);
    if (apiResponse.success) {
      controller.code.value = int.parse(apiResponse.message);
      controller.phoneNumber.value = controller.phoneController.text;
      Get.toNamed(
        AppRoutes.verificationScreen,
        arguments: {'isForget': true},
      );
      showSnackbar(
          message: '${'code_sent'.tr}  ${int.parse(apiResponse.message)}');
    } else {
      showSnackbar(
        message: apiResponse.message,
        success: apiResponse.success,
      );
    }
  }
}
