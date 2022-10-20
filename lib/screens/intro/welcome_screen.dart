import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImages.welcomeBg,
            fit: BoxFit.fill,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x00000000),
                  Color(0x008F8F8F),
                  Colors.black,
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.w, 125.h, 30.w, 50.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'login_greeting'.tr,
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'E-Grocery',
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.green,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Get.offNamed(AppRoutes.loginScreen);
                  },
                  child: Text('to_login'.tr),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () {
                    Get.offNamed(AppRoutes.registerScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    foregroundColor: AppColors.black,
                  ),
                  child: Text('to_register'.tr),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
