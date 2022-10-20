import 'package:e_grocery/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void getDeleteDialog({void Function()? onConfirm}) {
  Get.defaultDialog(
    title: 'Confirm Deletion',
    titlePadding: EdgeInsets.only(top: 20.h),
    middleText: '',
    content: Divider(
      thickness: 1,
      indent: 100.w,
      endIndent: 100.w,
    ),
    contentPadding: EdgeInsets.zero,
    radius: 10,
    actions: [
      TextButton(
        onPressed: onConfirm,
        child: const Text(
          'Yes',
          style: TextStyle(
            color: AppColors.green,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(width: 80.w),
      TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text(
          'No',
          style: TextStyle(
            color: AppColors.green,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
