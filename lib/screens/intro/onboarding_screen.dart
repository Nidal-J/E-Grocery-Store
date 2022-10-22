import 'dart:math';

import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/pref/shared_pref_controller.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    final List<String> title = <String>[
      'boarding1_title'.tr,
      'boarding2_title'.tr,
      'boarding3_title'.tr,
    ];
    final List<String> subTitle = <String>[
      'boarding1_info'.tr,
      'boarding2_info'.tr,
      'boarding3_info'.tr,
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(22.w, 90.h, 22.w, 0),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton.icon(
                onPressed: () {
                  Get.updateLocale(deviceLocale == 'ar'
                      ? const Locale('en')
                      : const Locale('ar'));
                  SharedPrefController()
                      .saveLang(deviceLocale == 'ar' ? 'en' : 'ar');
                },
                icon: const Icon(Icons.language_rounded),
                label: Text(deviceLocale == 'ar' ? 'En' : 'Ar'),
              ),
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                itemCount: 3,
                itemBuilder: (context, index) => Column(
                  children: [
                    // const Spacer(),
                    Image.asset(
                      '${AppImages.path}/onboarding${index + 1}.png',
                      height: 350.h,
                    ),
                    const Spacer(),
                    Text(
                      title[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      subTitle[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Transform(
                      transform:
                          Matrix4.rotationY(deviceLocale == 'ar' ? pi : 0),
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 70.w,
                            width: 70.w,
                            child: CircularProgressIndicator(
                              value: (1 / 3) * (index + 1),
                              color: AppColors.green,
                              backgroundColor: AppColors.lightGrey,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              index == 2
                                  ? Get.offNamed(AppRoutes.welcomeScreen)
                                  : pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.easeIn,
                                    );
                            },
                            child: CircleAvatar(
                              backgroundColor: AppColors.green,
                              radius: 30.r,
                              child: const Icon(Icons.east),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
