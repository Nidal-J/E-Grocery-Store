import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({Key? key}) : super(key: key);

  static const List<String> _topQuestionsTitles = [
    'Hi! How can we help?',
    'How to use collection point?',
    'What is Grocery?',
    'How can i add new delivery address?',
    'How can i avail Sticker Price?',
  ];
  static const List<String> _topicsTitles = [
    'My Account',
    'Payments & Wallet',
    'Shiping & Delivery',
    'Vouchers & Promotions',
    'Ordering',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GetBackButton(),
        title: Text('help_center'.tr),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        children: [
          Text(
            'help_center_opening'.tr,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 34.h,
          ),
          //     Container(
          //       decoration: BoxDecoration(
          //   color: AppColors.lightGrey,
          //   borderRadius: BorderRadius.circular(9.r),
          // ),
          // padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 26.h),
          // // margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //   Text('search',style: ),
          // ],),
          //     ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide.none,
              ),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
              filled: true,
              fillColor: AppColors.lightGrey,
              hintText: 'search'.tr,
              hintStyle: const TextStyle(
                color: AppColors.grey,
              ),
              suffixIcon: const Icon(Icons.search_rounded),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            'top_questions'.tr,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return ExpansionTile(
                // dense: true,
                // contentPadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.all(20.w),
                title: Text(
                  _topQuestionsTitles[index],
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // trailing: IconButton(
                //   onPressed: () {},
                //   icon: const Icon(
                //     Icons.arrow_forward_ios_rounded,
                //     size: 20,
                //   ),
                // ),
                children: [
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
                    'Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure.',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              );
            },
            // separatorBuilder: (BuildContext context, int index) {
            //   return Divider(
            //     thickness: 1,
            //     color: const Color(0xFFECECEC),
            //     endIndent: 20.w,
            //   );
            // },
          ),
          Divider(
            thickness: 2,
            height: 30.h,
            color: const Color(0xFFECECEC),
            endIndent: 20.w,
            indent: 20.w,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'topics'.tr,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return ExpansionTile(
                childrenPadding: EdgeInsets.all(20.w),
                title: Text(
                  _topicsTitles[index],
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                children: [
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
                    'Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure.',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                  ),
                ],
                // trailing: IconButton(
                //   onPressed: () {},
                //   icon: const Icon(
                //     Icons.arrow_forward_ios_rounded,
                //     size: 20,
                //   ),
                // ),
              );
            },
            // separatorBuilder: (BuildContext context, int index) {
            //   return Divider(
            //     thickness: 1,
            //     color: const Color(0xFFECECEC),
            //     endIndent: 20.w,
            //   );
            // },
          ),
          Divider(
            thickness: 2,
            height: 30.h,
            color: const Color(0xFFECECEC),
            endIndent: 20.w,
            indent: 20.w,
          ),

          // Text(
          //   '1. Agreement',
          //   style: TextStyle(
          //     fontSize: 16.sp,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // SizedBox(
          //   height: 12.h,
          // ),
          // Text(
          //   'Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure.',
          //   style: TextStyle(
          //     fontSize: 16.sp,
          //     fontWeight: FontWeight.w500,
          //     color: AppColors.grey,
          //   ),
          // ),
          // SizedBox(
          //   height: 18.h,
          // ),
          // Text(
          //   '2. Account',
          //   style: TextStyle(
          //     fontSize: 16.sp,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // SizedBox(
          //   height: 12.h,
          // ),
          // Text(
          //   'Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure.',
          //   style: TextStyle(
          //     fontSize: 16.sp,
          //     fontWeight: FontWeight.w500,
          //     color: AppColors.grey,
          //   ),
          // ),
          // SizedBox(
          //   height: 18.h,
          // ),
          // Text(
          //   '3. Relationship With Groceries',
          //   style: TextStyle(
          //     fontSize: 16.sp,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // SizedBox(
          //   height: 12.h,
          // ),
          // Text(
          //   'Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis voluptate cupidatat quis irure irure consequat irure.Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. Amet quis occaecat quis.',
          //   style: TextStyle(
          //     fontSize: 16.sp,
          //     fontWeight: FontWeight.w500,
          //     color: AppColors.grey,
          //   ),
          // ),
          // const Spacer(),
          // Center(
          //   child: Text(
          //     '2022 @ Nidal Alraey - Flutter Developer',
          //     style: TextStyle(
          //       fontSize: 14.sp,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
