import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AuthDialog extends StatelessWidget {
  const AuthDialog({
    Key? key,
    this.isForgotPassword = false,
    this.isResetPassword = false,
  }) : super(key: key);

  final bool isForgotPassword;
  final bool isResetPassword;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 60.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 80.r,
              backgroundColor: AppColors.lightGreen,
              child: Icon(
                Icons.done,
                color: AppColors.green,
                size: 80.r,
              ),
            ),
            SizedBox(
              height: 42.h,
            ),
            Text(
              isResetPassword ? '${'done'.tr} !!' : '${'verified'.tr} !!',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 21.h,
            ),
            Text(
              isResetPassword ? 'reset_success'.tr : 'verified_success'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            ElevatedButton(
              onPressed: () {
                if (isForgotPassword) {
                  Get.offNamed(AppRoutes.resetPassword);
                } else if (isResetPassword) {
                  Get.offAllNamed(AppRoutes.loginScreen);
                }
              },
              child: isForgotPassword
                  ? Text('create_password'.tr)
                  : Text('login_now'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
