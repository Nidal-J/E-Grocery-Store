import 'package:e_grocery/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

class NoData extends StatelessWidget {
  const NoData({
    this.text,
    Key? key,
  }) : super(key: key);
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        alignment: Alignment.center,
        child: Text(
          text ?? 'No Data'.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.grey,
            wordSpacing: 1.2,
            letterSpacing: 1,
          ),
        ));
  }
}
