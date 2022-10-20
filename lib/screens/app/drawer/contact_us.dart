import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final storeController = Get.find<StoreController>();
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: const GetBackButton(),
        title: Text('contact'.tr),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30.r),
        ),
        padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 26.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'contact'.tr,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.green,
                  radius: 18.r,
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: 17.r,
                    child: const Icon(
                      Icons.phone,
                      color: AppColors.green,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '+972 592 585 462',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(height: 14.w),
                    Text(
                      '+972 598 276 166',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.green,
                  radius: 18.r,
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: 17.r,
                    child: const Icon(
                      Icons.mail_rounded,
                      color: AppColors.green,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Text(
                  'nidal.alraey@gmail.com',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.green,
                  radius: 18.r,
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: 17.r,
                    child: const Icon(
                      Icons.location_on_rounded,
                      color: AppColors.green,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '26/C Mohammadpur',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(height: 14.w),
                    Text(
                      'Dhaka, Bangladesh',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Image.asset('${AppImages.path}/map.png'),
          ],
        ),
      ),
    );
  }
}
