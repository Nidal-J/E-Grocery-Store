import 'package:e_grocery/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteShimmer extends StatelessWidget {
  const FavoriteShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 0),
        itemCount: 7,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Container(
                height: 80.r,
                width: 80.r,
                color: AppColors.grey,
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 15.h,
                      // width: double.infinity,
                      color: AppColors.grey,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      height: 15.h,
                      // width: double.infinity,
                      color: AppColors.grey,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      height: 20.h,
                      width: 150.w,
                      color: AppColors.grey,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 30.h,
        ),
      ),
    );
  }
}
