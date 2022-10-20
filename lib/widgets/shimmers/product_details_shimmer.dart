import 'package:e_grocery/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsShimmer extends StatelessWidget {
  const ProductDetailsShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(30.r),
            height: 250.h,
            width: double.infinity,
            color: AppColors.grey,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            height: 40.h,
            width: 200.w,
            color: AppColors.grey,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            height: 80.h,
            width: double.infinity,
            color: AppColors.lightGrey,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            height: 40.h,
            width: 300.w,
            color: AppColors.grey,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            height: 30.h,
            width: 300.w,
            color: AppColors.grey,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  height: 30.h,
                  width: 100.w,
                  color: AppColors.grey,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  height: 30.h,
                  width: 100.w,
                  color: AppColors.grey,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  height: 30.h,
                  width: 100.w,
                  color: AppColors.grey,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            height: 30.h,
            width: 300.w,
            color: AppColors.grey,
          ),
        ],
      ),
    );
  }
}
