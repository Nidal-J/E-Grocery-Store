import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderEmepty extends StatelessWidget {
  const OrderEmepty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GetBackButton(),
        title: Text('order'.tr),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(
              height: 24.h,
            ),
            Text(
              'no_orders'.tr,
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            Text(
              'no_orders_info'.tr,
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
                Get.offNamedUntil(
                  AppRoutes.subCategoriesScreen,
                  (route) => route.settings.name == AppRoutes.homeScreen,
                );
              },
              child: Text('browse_products'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
