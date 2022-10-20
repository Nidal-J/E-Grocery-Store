import 'package:e_grocery/api/controllers/auth_api_controller.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/models/api_response.dart';
import 'package:e_grocery/utils/show_snackbar.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:e_grocery/widgets/register_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool visibility1 = false;
  bool visibility2 = false;

  late final TextEditingController oldPasswordController;
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
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
        title: Text('change_password'.tr),
      ),
      body: Container(
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
                controller: oldPasswordController,
                label: 'old_password'.tr,
                isPassword: true,
              ),
              SizedBox(
                height: 20.h,
              ),
              RegisterField(
                controller: newPasswordController,
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
                      : const Icon(Icons.visibility_off, color: AppColors.grey),
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
                    await _performChangePassword();
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
    );
  }

  Future<void> _performChangePassword() async {
    if (newPasswordController.text == confirmPasswordController.text) {
      ApiResponse apiResponse = await AuthApiController().changePassword(
          currentPassword: oldPasswordController.text,
          newPassword: newPasswordController.text,
          newPasswordConfirmation: confirmPasswordController.text);

      showSnackbar(
        message: apiResponse.message,
        success: apiResponse.success,
      );
      return;
    }
    showSnackbar(
      message: 'passwords_not_match'.tr,
      success: false,
    );
  }
}
