import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 140.r,
                  backgroundColor: AppColors.green.withOpacity(0.1),
                  child: Image.asset(
                    '${AppImages.path}/orders_basket_success.png',
                    height: 140.r,
                    width: 140.r,
                  ),
                ),
                PositionedDirectional(
                  top: 50.h,
                  end: 80.w,
                  child: Icon(
                    Icons.check_circle,
                    color: AppColors.green,
                    size: 34.r,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'success_order'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            Text(
              'success_order_info'.tr,
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
              child: Text('continue'.tr),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'track_order'.tr,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
