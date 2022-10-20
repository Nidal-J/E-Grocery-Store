import 'package:e_grocery/api/controllers/auth_api_controller.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/get/controllers/auth/forget_controller.dart';
import 'package:e_grocery/models/api_response.dart';
import 'package:e_grocery/screens/auth/login_screen.dart';
import 'package:e_grocery/utils/show_snackbar.dart';
import 'package:e_grocery/widgets/auth_dialog.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:e_grocery/widgets/register_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool visibility1 = false;
  bool visibility2 = false;
  final controller = Get.find<ForgetController>();

  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        leading: const GetBackButton(),
        title: Text('new_password'.tr),
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
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'add_new_password'.tr,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  RegisterField(
                    controller: passwordController,
                    label: 'new_password'.tr,
                    isPassword: true,
                    obscureText: !visibility1,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visibility1 = !visibility1;
                        });
                      },
                      icon: visibility1
                          ? const Icon(
                              Icons.visibility,
                              color: AppColors.black,
                            )
                          : const Icon(Icons.visibility_off,
                              color: AppColors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  RegisterField(
                    controller: confirmPasswordController,
                    label: 'confirm_password'.tr,
                    isPassword: true,
                    textInputAction: TextInputAction.done,
                    obscureText: !visibility2,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visibility2 = !visibility2;
                        });
                      },
                      icon: visibility2
                          ? const Icon(
                              Icons.visibility,
                              color: AppColors.black,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: AppColors.grey,
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        controller.isResettingPassword(true);
                        await _performResetPassword();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(Get.width, 56.h),
                    ),
                    child: Text('done'.tr),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.isResettingPassword.value,
              child: const LoadingWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _performResetPassword() async {
    if (passwordController.text == confirmPasswordController.text) {
      ApiResponse apiResponse = await AuthApiController().resetPassword(
        phoneNumber: controller.phoneNumber.value,
        code: controller.code.value.toString(),
        password: passwordController.text,
      );
      controller.isResettingPassword(false);
      if (apiResponse.success) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const AuthDialog(
            isResetPassword: true,
            // phoneNumber: controller.phoneNumber.value,
            // password: passwordController.text,
          ),
        );
      } else {
        showSnackbar(message: apiResponse.message, success: false);
      }
      return;
    }
    showSnackbar(
      message: 'passwords_not_match'.tr,
      success: false,
    );
  }
}
