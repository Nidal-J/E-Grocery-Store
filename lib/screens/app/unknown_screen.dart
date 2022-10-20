import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.of(context).canPop() ? const GetBackButton() : null,
        title: Text('unfound'.tr),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 140.r,
              backgroundColor: AppColors.green.withOpacity(0.1),
              backgroundImage: const AssetImage('${AppImages.path}/404.png'),
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'unfound_st1'.tr,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            Text(
              'unfound_st2'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.grey,
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(AppRoutes.homeScreen);
              },
              child: Text('browse_home'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
