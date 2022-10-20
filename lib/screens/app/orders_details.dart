import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});
  static const List<Color> _listOfColors = [
    AppColors.orderConfrirmed,
    AppColors.orderProcessing,
    AppColors.orderShipped,
    AppColors.green,
  ];
  static const List<String> _listOfImages = [
    '${AppImages.iconPath}/confirmed_order.png',
    '${AppImages.iconPath}/processing_order.png',
    '${AppImages.iconPath}/shipped_order.png',
    '${AppImages.iconPath}/delivered_order.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: const GetBackButton(),
        title: const Text('Order Details'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30.r),
        ),
        padding: EdgeInsets.fromLTRB(20.w, 25.h, 20.w, 25.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Oreder ID # 32773728',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 30.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40.w,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: 4,
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 30.h,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: _listOfColors[index],
                            borderRadius: BorderRadius.circular(9.r),
                          ),
                          child: Image.asset(_listOfImages[index]),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        Container(
                          height: 14.r,
                          width: 14.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            border: Border.all(
                              width: 3,
                              color: AppColors.green,
                            ),
                          ),
                        ),
                        Container(
                          height: 69.h,
                          width: 4.w,
                          color: AppColors.green,
                        ),
                        Container(
                          height: 14.r,
                          width: 14.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            border: Border.all(
                              width: 3,
                              color: AppColors.green,
                            ),
                          ),
                        ),
                        Container(
                          height: 56.h,
                          width: 4.w,
                          color: AppColors.green,
                        ),
                        Container(
                          height: 14.r,
                          width: 14.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            border: Border.all(
                              width: 3,
                              color: AppColors.green,
                            ),
                          ),
                        ),
                        Container(
                          height: 56.h,
                          width: 4.w,
                          color: AppColors.green,
                        ),
                        Container(
                          height: 14.r,
                          width: 14.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            border: Border.all(
                              width: 3,
                              color: AppColors.green,
                            ),
                          ),
                        ),
                        Container(
                          height: 13.h,
                          width: 4.w,
                          color: AppColors.green,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: 4,
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 30.h,
                      ),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 40.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Order Confirmed',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  const Text(
                                    '12.12.2022',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                '01:00 pm',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 38.h,
            ),
            Text(
              'Product Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) => Column(
                children: [
                  Row(
                    children: [
                      Image.asset('${AppImages.productPath}/carrot.png'),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'product name',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            '1 kg',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$ 30',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                            ),
                          ),
                          Text(
                            '3x',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.orderStatusBg,
                    height: 32.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  '\$ 120',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Paid from',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  'Master Card',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
