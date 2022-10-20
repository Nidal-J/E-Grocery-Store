import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/get/controllers/home_controller.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final storeController = Get.find<StoreController>();
    final homeController = Get.find<HomeController>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 140.r,
            backgroundColor: AppColors.green.withOpacity(0.1),
            child: Image.asset('${AppImages.path}/empty_cart.png'),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'opps'.tr,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Text(
            'empty_cart'.tr,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black.withOpacity(0.7),
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          ElevatedButton(
            onPressed: () async {
              // DbController().database.execute('DROP TABLE IF EXISTS cart');
              // print('deleted');

              // await DbController().database.execute('CREATE TABLE cart ('
              //     'id INTEGER PRIMARY KEY AUTOINCREMENT,'
              //     'name TEXT NOT NULL,'
              //     'image_url TEXT NOT NULL,'
              //     'quantity INTEGER NOT NULL,'
              //     'price REAL NOT NULL,'
              //     'total_price REAL NOT NULL,'
              //     'product_id INTEGER NOT NULL'
              //     ')');
              // print('created');

              homeController.updatePageIndex(1);
              Get.offAllNamed(AppRoutes.homeScreen);
            },
            child: Text('start_browsing'.tr),
          ),
        ],
      ),
    );
  }
}
