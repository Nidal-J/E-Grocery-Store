import 'package:e_grocery/api/controllers/faqs_api_controller.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/models/faqs_model.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:e_grocery/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class Faqs extends StatelessWidget {
  const Faqs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GetBackButton(),
        title: Text('common_quetions'.tr),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        child: FutureBuilder<List<FaqsModel>?>(
            future: FaqsApiController().getFaqs(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? snapshot.data!.isEmpty
                      ? const NoData()
                      : ListView.separated(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${++index}. ${snapshot.data![index].question}',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                snapshot.data![index].answer,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grey,
                                ),
                              ),
                              // SizedBox(
                              //   height: 40.h,
                              // ),
                              // Text(
                              //   '2. What is refund system?',
                              //   style: TextStyle(
                              //     fontSize: 20.sp,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 20.h,
                              // ),
                              // Text(
                              //   'Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.',
                              //   style: TextStyle(
                              //     fontSize: 16.sp,
                              //     fontWeight: FontWeight.w500,
                              //     color: AppColors.grey,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 40.h,
                              // ),
                              // Text(
                              //   '3. WTF is going on here ?',
                              //   style: TextStyle(
                              //     fontSize: 20.sp,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 20.h,
                              // ),
                              // Text(
                              //   'Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien.',
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
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            height: 40.h,
                          ),
                        )
                  : Shimmer.fromColors(
                      baseColor: AppColors.shimmerBaseColor,
                      highlightColor: AppColors.shimmerHighlightColor,
                      child: ListView.builder(
                        padding: EdgeInsets.all(20.r),
                        itemCount: 5,
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 20.h,
                              width: 150.w,
                              color: AppColors.black,
                            ),
                            Container(
                              height: 80.h,
                              width: Get.width,
                              color: AppColors.grey,
                              margin: EdgeInsets.only(top: 10.h, bottom: 25.h),
                            ),
                          ],
                        ),
                      ),
                    );
            }),
      ),
    );
  }
}
