import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/pref/shared_pref_controller.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:e_grocery/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offNamed(
          SharedPrefController().loggedIn
              ? AppRoutes.homeScreen
              : AppRoutes.onboardingScreen,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment(1.4.w, -1.2.h),
              children: [
                CircleAvatar(
                  radius: 11.r,
                  backgroundColor: const Color(0xFFA2E7AF),
                ),
                Image.asset(AppImages.logo),
              ],
            ),
            SizedBox(
              width: 16.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTitle(
                  fontSizePart1: 42.sp,
                  fontSizePart2: 36.sp,
                ),
                Text(
                  'your daily needs',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
