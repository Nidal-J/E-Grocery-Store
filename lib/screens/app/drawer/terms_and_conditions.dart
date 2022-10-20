import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GetBackButton(),
        title: Text('terms_conditions'.tr),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
            children: [
              Text(
                'General site usage last revised \nDecember 12-01-2020.',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                'Welcome to www.saydulmoon.info. Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure.',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                '1. Agreement',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure.',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                '2. Account',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure.',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                '3. Relationship With Groceries',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure.Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis.',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Text(
              '2022 @ Nidal Alraey - Flutter Developer',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
