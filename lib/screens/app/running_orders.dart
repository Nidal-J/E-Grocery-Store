import 'package:e_grocery/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RunningOrders extends StatelessWidget {
  const RunningOrders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: const [
                  Text(
                    'Oreder ID:  ',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '26735363',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '25 Nov',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Status:',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 7.r,
                              backgroundColor: AppColors.orderConfrirmed,
                            ),
                            Expanded(
                              child: Container(
                                height: 4.h,
                                color: AppColors.orderStatusBg,
                              ),
                            ),
                            CircleAvatar(
                              radius: 7.r,
                              backgroundColor: AppColors.orderStatusBg,
                            ),
                            Expanded(
                              child: Container(
                                height: 4.h,
                                color: AppColors.orderStatusBg,
                              ),
                            ),
                            CircleAvatar(
                              radius: 7.r,
                              backgroundColor: AppColors.orderStatusBg,
                            ),
                            Expanded(
                              child: Container(
                                height: 4.h,
                                color: AppColors.orderStatusBg,
                              ),
                            ),
                            CircleAvatar(
                              radius: 7.r,
                              backgroundColor: AppColors.orderStatusBg,
                            ),
                            // ECECEC
                          ],
                        ),
                        SizedBox(height: 5.h),
                        const Text(
                          'Confirmed',
                          style: TextStyle(
                            color: AppColors.orderConfrirmed,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 12.h,
      ),
    );
  }
}
