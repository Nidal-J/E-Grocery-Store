import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderFail extends StatelessWidget {
  const OrderFail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 140.r,
                  backgroundColor: AppColors.green.withOpacity(0.1),
                  child: Image.asset(
                    '${AppImages.path}/orders_basket_empty.png',
                    height: 140,
                    width: 140,
                  ),
                ),
                PositionedDirectional(
                  top: 50.h,
                  end: 80.w,
                  child: CircleAvatar(
                    backgroundColor: AppColors.danger,
                    radius: 17.r,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'fail_order'.tr,
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            Text(
              'fail_order_info'.tr,
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
                Get.back();
              },
              child: Text('try_again'.tr),
            ),
            TextButton(
              onPressed: () {
                Get.offAllNamed(AppRoutes.homeScreen);
              },
              child: Text(
                'browse_home'.tr,
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
