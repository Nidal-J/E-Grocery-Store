import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final storeController = Get.find<StoreController>();
    return Scaffold(
      // backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: const GetBackButton(),
        title: Text('notifications'.tr),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundColor: const Color(0xFF3373F6),
                child: SvgPicture.asset('${AppImages.iconPath}/gift_offer.svg'),
              ),
              SizedBox(
                width: 20.h,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gifts Offer',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Hot Deal Buy one get free one Offer Hery oooooooooooooooo',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Text(
                      'Now',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      height: 20.h,
                      color: AppColors.lightGrey,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
