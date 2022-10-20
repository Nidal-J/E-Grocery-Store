import 'package:e_grocery/api/controllers/auth_api_controller.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/models/api_response.dart';
import 'package:e_grocery/pref/shared_pref_controller.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:e_grocery/screens/auth/login_screen.dart';
import 'package:e_grocery/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const List<IconData> _listOfIcons = [
    Icons.person_outline_rounded,
    Icons.notifications_rounded,
    Icons.settings_rounded,
    Icons.account_balance_wallet_rounded,
    Icons.lock_reset_rounded,
    Icons.logout_rounded,
  ];
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoggingOut = false;

  @override
  Widget build(BuildContext context) {
    final List<String> listOfTitles = [
      'my_profile'.tr,
      'notifications'.tr,
      'settings'.tr,
      'payment'.tr,
      'change_password'.tr,
      'log_out'.tr,
    ];
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('${AppImages.path}/profile_bg.png'),
              alignment: Alignment(-1.w, -1.6.h),
              fit: BoxFit.contain,
            ),
          ),
          padding:
              EdgeInsetsDirectional.only(top: 100.h, start: 20.w, end: 20.w),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  CircleAvatar(
                    radius: 40.r,
                    backgroundColor: const Color(0xFFFFC3BF),
                    child: Image.asset(
                      SharedPrefController()
                                  .getByKey(key: PrefKeys.gender.name) ==
                              'M'
                          ? '${AppImages.path}/male_avatar.png'
                          : '${AppImages.path}/female_avatar.jpg',
                      height: 60.r,
                      width: 60.r,
                    ),
                  ),
                  // Stack(
                  //   alignment: AlignmentDirectional.bottomEnd,
                  //   children: [
                  //     CircleAvatar(
                  //       radius: 45.r,
                  //       backgroundColor: const Color(0xFFFFC3BF),
                  //       backgroundImage:
                  //           const AssetImage('${AppImages.path}/person.png'),
                  //     ),
                  //     CircleAvatar(
                  //       radius: 17.r,
                  //       backgroundColor: AppColors.white,
                  //       child: const Icon(
                  //         Icons.photo_camera_outlined,
                  //         size: 17,
                  //         color: AppColors.green,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        SharedPrefController()
                            .getByKey(key: PrefKeys.name.name),
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        'ID: ${SharedPrefController().getByKey(key: PrefKeys.id.name)}',
                        style: const TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 30.h, bottom: 20.h),
                height: 130.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(13.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.ordersScreen);
                      },
                      child: SizedBox(
                        width: 70.r,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50.r,
                              width: 50.r,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF6AA9FF),
                                    Color(0xFF005AD5),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: const Icon(
                                Icons.fire_truck_outlined,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'all_orders'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.offersScreen);
                      },
                      child: SizedBox(
                        width: 70.r,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50.r,
                              width: 50.r,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFFF6A9F),
                                    Color(0xFFD50059),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: const Icon(
                                Icons.card_giftcard_outlined,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'offers_promos'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.addressesScreen);
                      },
                      child: SizedBox(
                        width: 70.r,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50.r,
                              width: 50.r,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF6DF5FC),
                                    Color(0xFF3CB6BB),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: const Icon(
                                Icons.home_filled,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'delivery_address'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 10.w),
                  margin: EdgeInsets.only(bottom: 30.h),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(13.r),
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ProfileOptions(
                        icon: Profile._listOfIcons[0],
                        title: listOfTitles[0],
                        gradientColor1: const Color(0xFFCDFF9D),
                        gradientColor2: const Color(0xFF40C269),
                        onTap: () {
                          Get.toNamed(AppRoutes.profileScreen);
                        },
                      ),
                      ProfileOptions(
                        icon: Profile._listOfIcons[1],
                        title: listOfTitles[1],
                        gradientColor1: const Color(0xFF6DF5FC),
                        gradientColor2: const Color(0xFF46C5CA),
                        onTap: () {
                          Get.toNamed(AppRoutes.notificationsScreen);
                        },
                      ),
                      ProfileOptions(
                        icon: Profile._listOfIcons[2],
                        title: listOfTitles[2],
                        gradientColor1: const Color(0xFFDF9EF5),
                        gradientColor2: const Color(0xFFA24ABF),
                        onTap: () {
                          Get.toNamed(AppRoutes.settingsScreen);
                        },
                      ),
                      ProfileOptions(
                        icon: Profile._listOfIcons[3],
                        title: listOfTitles[3],
                        gradientColor1: const Color(0xFF9E93F4),
                        gradientColor2: const Color(0xFF7465EC),
                        onTap: () {
                          Get.toNamed(AppRoutes.paymentCardsScreen);
                        },
                      ),
                      ProfileOptions(
                        icon: Profile._listOfIcons[4],
                        title: listOfTitles[4],
                        gradientColor1: const Color(0xFF6AA9FF),
                        gradientColor2: const Color(0xFF005AD5),
                        onTap: () async {
                          Get.toNamed(AppRoutes.changePassword);
                        },
                      ),
                      ProfileOptions(
                        icon: Profile._listOfIcons[5],
                        title: listOfTitles[5],
                        gradientColor1: const Color(0xFFFF9CCB),
                        gradientColor2: const Color(0xFFEC4091),
                        onTap: () async {
                          setState(() {
                            isLoggingOut = true;
                          });
                          await _performLogout();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: isLoggingOut,
          child: const LoadingWidget(),
        ),
      ],
    );
  }

  Future<void> _performLogout() async {
    ApiResponse apiResponse = await AuthApiController().logout();
    if (apiResponse.success) {
      Get.offAllNamed(AppRoutes.loginScreen);
    }
    showSnackbar(message: apiResponse.message, success: apiResponse.success);
  }
}

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({
    Key? key,
    required IconData icon,
    required String title,
    required Color gradientColor1,
    required Color gradientColor2,
    void Function()? onTap,
  })  : _icon = icon,
        _title = title,
        _gradientColor1 = gradientColor1,
        _gradientColor2 = gradientColor2,
        _onTap = onTap,
        super(key: key);

  final IconData _icon;
  final String _title;
  final Color _gradientColor1;
  final Color _gradientColor2;
  final void Function()? _onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16.h),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.lightGrey)),
      ),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            margin: EdgeInsetsDirectional.only(end: 20.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  _gradientColor1,
                  _gradientColor2,
                ],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              _icon,
              color: AppColors.white,
              size: 18,
            ),
          ),
          Text(
            _title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
          ),
          const Spacer(),
          InkWell(
            onTap: _onTap,
            child: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
