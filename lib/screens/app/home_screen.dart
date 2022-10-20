import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/get/controllers/home_controller.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:e_grocery/widgets/app_title.dart';
import 'package:e_grocery/widgets/bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:e_grocery/screens/app/tabs/favorite.dart';
import 'package:e_grocery/screens/app/tabs/home.dart';
import 'package:e_grocery/screens/app/tabs/categories.dart';
import 'package:e_grocery/screens/app/tabs/profile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final homeController = Get.find<HomeController>();

  final List<Widget> _listScreens = [
    const Home(),
    const Categories(),
    const Favorite(),
    const Profile(),
  ];

  final List<String> _shareImages = [
    'assets/images/media/facebook.png',
    'assets/images/media/whatsapp.png',
    'assets/images/media/telegram.png',
    'assets/images/media/twitter.png',
    'assets/images/media/linkedin.png',
    'assets/images/media/messages.png',
  ];

  final List<IconData> _drawerIcons = [
    Icons.share_rounded,
    Icons.groups_rounded,
    Icons.question_mark_rounded,
    Icons.help_center_rounded,
    Icons.phone_rounded,
    Icons.gavel_rounded,
    Icons.policy_rounded,
    Icons.star_rate_rounded,
  ];

  final List<Color> _drawerIconsColors = [
    Colors.deepPurple,
    Colors.blue,
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.green,
    Colors.black,
    Colors.blueAccent,
    Colors.amber,
  ];

  final List<dynamic> _drawerRoutes = [
    AppRoutes.aboutUs,
    AppRoutes.faqs,
    AppRoutes.helpCenter,
    AppRoutes.contactUs,
    AppRoutes.termsAndConditions,
    AppRoutes.privacyPolicy,
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> appBarTitles = [
      'categories'.tr,
      'favorite_list'.tr,
      'profile'.tr,
    ];
    final List<String> drawerTitles = [
      'invite_friend'.tr,
      'about'.tr,
      'faqs'.tr,
      'help_center'.tr,
      'contact'.tr,
      'terms_conditions'.tr,
      'policy_privacy'.tr,
      'rate_app'.tr,
    ];

    return Obx(
      () => Scaffold(
        extendBodyBehindAppBar: homeController.pageIndex.value == 3,
        backgroundColor: homeController.pageIndex.value == 3
            ? AppColors.scaffoldBg
            : AppColors.white,
        appBar: homeController.isHome.value
            ? AppBar(
                title: InkWell(
                  onTap: () {
                    homeController.updatePageIndex(0);
                  },
                  child: AppTitle(
                    fontSizePart1: 26.sp,
                    fontSizePart2: 24.sp,
                  ),
                ),
                centerTitle: false,
                actions: [
                  Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          size: 28,
                        ),
                      ),
                      PositionedDirectional(
                        top: 15,
                        end: 25,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 2.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: AppColors.danger,
                          ),
                          child: Text(
                            '999',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : AppBar(
                foregroundColor: homeController.pageIndex.value == 3
                    ? AppColors.white
                    : AppColors.black,
                title: Text(
                  appBarTitles[homeController.pageIndex.value - 1],
                  style: TextStyle(
                    color: homeController.pageIndex.value == 3
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    homeController.pageIndex.value = 0;
                    homeController.isHome.value = true;
                  },
                  icon: Icon(
                    userLocale == 'ar'
                        ? Icons.east_rounded
                        : Icons.west_rounded,
                    size: 30.r,
                  ),
                ),
              ),
        drawer: Drawer(
          backgroundColor: AppColors.white,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: AssetImage('${AppImages.path}/drawer_bg.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Color(0x66000000),
                      BlendMode.darken,
                    ),
                  ),
                ),
                padding: EdgeInsets.only(bottom: 20.h),
                child: AppTitle(
                  fontSizePart1: 40.sp,
                  fontSizePart2: 44.sp,
                  color: AppColors.white,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(20.w, 20.w, 10, 20.w),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        _drawerIcons[index],
                        color: _drawerIconsColors[index],
                      ),
                      horizontalTitleGap: 0.w,
                      title: Text(
                        drawerTitles[index],
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          index == 0
                              ? _performShare()
                              : index == 7
                                  ? _performRate()
                                  : Get.toNamed(_drawerRoutes[index - 1]);
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return index != 6
                        ? Divider(
                            thickness: 1,
                            color: const Color(0xFFECECEC),
                            endIndent: 20.w,
                          )
                        : SizedBox(height: 50.sp);
                  },
                ),
              ),
            ],
          ),
        ),
        body: _listScreens[homeController.pageIndex.value],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutes.cartScreen);
          },
          backgroundColor: AppColors.green,
          child: SvgPicture.asset('${AppImages.iconPath}/cart.svg'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: Container(
            height: 70,
            decoration: const BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 30,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            homeController.updatePageIndex(0);
                          },
                          child: BottomNavItem(
                            icon: Icons.home_rounded,
                            title: 'home'.tr,
                            index: 0,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            homeController.updatePageIndex(1);
                          },
                          child: BottomNavItem(
                            icon: Icons.category_rounded,
                            title: 'categories'.tr,
                            index: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 100.w,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(end: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            homeController.updatePageIndex(2);
                          },
                          child: BottomNavItem(
                            icon: Icons.favorite_rounded,
                            title: 'favorite'.tr,
                            index: 2,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            homeController.updatePageIndex(3);
                          },
                          child: BottomNavItem(
                            icon: Icons.person_pin_rounded,
                            title: 'profile'.tr,
                            index: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _performShare() async {
    final List<String> shareTitles = [
      'facebook'.tr,
      'whatsup'.tr,
      'telegram'.tr,
      'twitter'.tr,
      'linkedin'.tr,
      'message'.tr,
    ];
    Get.bottomSheet(
      BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.r),
          ),
        ),
        onClosing: () {},
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 24.h,
              ),
              Text(
                'share'.tr,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  shadows: const [
                    Shadow(
                      color: AppColors.grey,
                      blurRadius: 30,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                padding: EdgeInsets.all(30.r),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 30.r,
                  crossAxisSpacing: 30.r,
                ),
                itemCount: 6,
                itemBuilder: (context, index) => Column(
                  children: [
                    Image.asset(
                      _shareImages[index],
                      height: 70.r,
                      width: 70.r,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(shareTitles[index]),
                  ],
                ),
                // children: [
                //   Column(
                //     children: [
                //       Image.asset('assets/images/media/facebook.png'),
                //       Text('facebook'.tr),
                //     ],
                //   ),
                //   Container(
                //     decoration: const BoxDecoration(
                //       boxShadow: [
                //         BoxShadow(
                //           color: Color.fromARGB(137, 33, 149, 243),
                //           blurRadius: 40,
                //           spreadRadius: 0,
                //           offset: Offset(0, 5),
                //         ),
                //       ],
                //     ),
                //     child: Image.asset('assets/images/media/twitter.png'),
                //   ),
                //   Container(
                //     decoration: const BoxDecoration(
                //       boxShadow: [
                //         BoxShadow(
                //           color: Color.fromARGB(130, 96, 125, 139),
                //           blurRadius: 40,
                //           spreadRadius: 0,
                //           offset: Offset(0, 5),
                //         ),
                //       ],
                //     ),
                //     child: Image.asset(
                //       'assets/images/media/telegram.png',
                //       // fit: BoxFit.cover,
                //     ),
                //   ),
                //   Container(
                //     decoration: const BoxDecoration(
                //       boxShadow: [
                //         BoxShadow(
                //           color: Color.fromARGB(130, 76, 175, 79),
                //           blurRadius: 40,
                //           spreadRadius: 0,
                //           offset: Offset(0, 5),
                //         ),
                //       ],
                //     ),
                //     child: Image.asset('assets/images/media/whatsapp.png'),
                //   ),
                //   Container(
                //     decoration: const BoxDecoration(
                //       boxShadow: [
                //         BoxShadow(
                //           color: Color.fromARGB(130, 64, 195, 255),
                //           blurRadius: 40,
                //           spreadRadius: 0,
                //           offset: Offset(0, 5),
                //         ),
                //       ],
                //     ),
                //     child: Image.asset('assets/images/media/linkedin.png'),
                //   ),
                //   Container(
                //     decoration: const BoxDecoration(
                //       boxShadow: [
                //         BoxShadow(
                //           color: Color.fromARGB(130, 68, 137, 255),
                //           blurRadius: 40,
                //           spreadRadius: 0,
                //           offset: Offset(0, 5),
                //         ),
                //       ],
                //     ),
                //     child: Image.asset('assets/images/media/messages.png'),
                //   ),
                // ],
              ),
            ],
          );
        },
      ),
    );
  }

  Future<dynamic> _performRate() => Get.bottomSheet(
        //TODO: MAKE REAL RATE FOR APP
        BottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.r),
            ),
          ),
          onClosing: () {},
          builder: (context) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Rate E-Grocery App',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      shadows: const [
                        Shadow(
                          color: AppColors.grey,
                          blurRadius: 30,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  RatingBar.builder(
                    glowColor: AppColors.green.withOpacity(0.5),
                    unratedColor: AppColors.grey,
                    initialRating: 5,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
}


  // Future<dynamic> _performRate() => Get.defaultDialog(
  //       titlePadding: EdgeInsets.only(top: 24.h),
  //       contentPadding: EdgeInsets.only(top: 24.h),
  //       radius: 10.r,
  //       title: 'Rate E-Grocery App',
  //       content: RatingBar.builder(
  //         glowColor: AppColors.green.withOpacity(0.5),
  //         unratedColor: AppColors.grey,
  //         initialRating: 5,
  //         itemBuilder: (context, index) => const Icon(
  //           Icons.star_rate_rounded,
  //           color: Colors.amber,
  //         ),
  //         onRatingUpdate: (rating) {},
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             Get.back();
  //           },
  //           child: const Text('Cancel'),
  //         ),
  //         SizedBox(
  //           width: 30.w,
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             Get.back();
  //           },
  //           child: const Text('Ok'),
  //         ),
  //       ],
  //     );
