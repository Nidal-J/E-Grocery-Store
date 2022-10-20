import 'dart:developer';
import 'package:dotted_border/dotted_border.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/constants/filters.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PaymentCardsScreen extends StatelessWidget {
  const PaymentCardsScreen({Key? key}) : super(key: key);
  static const List<String> cardNames = [
    'master card',
    'visa',
    'paypal',
    'google pay',
  ];
  static const List<String> cardPictures = [
    'master_card.svg',
    'visa.svg',
    'paypal.svg',
    'google_pay.svg',
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          leading: const GetBackButton(),
          title: const Text('Payment cards'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You curently have no saved paymend method. Get stard by adding one.',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                '  Payment',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 20.h),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    log(index.toString());
                    return index == 4
                        ? DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(12.r),
                            color: AppColors.grey,
                            strokeWidth: 1,
                            dashPattern: const [6, 3],
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 20.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle_outline_rounded,
                                  size: 30.r,
                                  color: AppColors.grey,
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                const Text(
                                  'Add Card',
                                )
                              ],
                            ),
                          )
                        : IgnorePointer(
                            ignoring: index >= 2,
                            child: ColorFiltered(
                              colorFilter: index >= 2
                                  ? const ColorFilter.matrix(Filters.disabled)
                                  : const ColorFilter.matrix(Filters.enabled),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.addPaymentCard);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 14.h),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.h),
                                      height: 80.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(13.r),
                                        color: index >= 2
                                            ? Colors.grey.shade300
                                            : AppColors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 40.r,
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            offset: Offset(0, 7.r),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 30.r,
                                            backgroundColor:
                                                AppColors.lightGrey,
                                            child: SvgPicture.asset(
                                                '${AppImages.paymentCardPath}/${cardPictures[index]}'),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Text(
                                            cardNames[index].toTitleCase(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const Spacer(),
                                          Icon(
                                            Icons.circle_outlined,
                                            size: 14.r,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: index == 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 20.h, bottom: 20.h),
                                      child: Text(
                                        '  SOON will be available ...',
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
