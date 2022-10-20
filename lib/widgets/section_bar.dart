import 'package:e_grocery/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

class SectionBar extends StatelessWidget {
  const SectionBar({
    required this.title,
    this.onTap,
    Key? key,
  }) : super(key: key);
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 20.w, top: 24.h, bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              'view_all'.tr,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
