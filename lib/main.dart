import 'package:e_grocery/database/db_controller.dart';
import 'package:e_grocery/localization/app_translations.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/get/bindings/store_binding.dart';
import 'package:e_grocery/pref/shared_pref_controller.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:e_grocery/screens/app/unknown_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbController().initDatabase();
  await SharedPrefController().initPrefeerences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     statusBarIconBrightness: Brightness.dark,
    //   ),
    // );
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Montserrat',
            expansionTileTheme: const ExpansionTileThemeData(
              textColor: AppColors.green,
              iconColor: AppColors.green,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(Get.width, 56.h),
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
                backgroundColor: AppColors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                fixedSize: Size(Get.width, 56.h),
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
                foregroundColor: AppColors.green,
                side: const BorderSide(color: AppColors.green),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
                foregroundColor: AppColors.green,
              ),
            ),
            scaffoldBackgroundColor: AppColors.white,
            appBarTheme: AppBarTheme(
              centerTitle: true,
              titleTextStyle: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              foregroundColor: AppColors.black,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
            // bottomNavigationBarTheme: BottomNavigationBarThemeData(
            //   type: BottomNavigationBarType.fixed,
            //   elevation: 0,
            //   backgroundColor: AppColors.white,
            //   selectedLabelStyle: TextStyle(fontSize: 14.sp),
            //   unselectedLabelStyle: TextStyle(fontSize: 14.sp),
            //   selectedItemColor: AppColors.green,
            //   unselectedItemColor: AppColors.black.withOpacity(0.4),
            //   showUnselectedLabels: true,
            // ),
            textTheme: TextTheme(
              // bodyText1: TextStyle(
              //   color: AppColors.black,
              //   fontSize: 14.sp,
              // ),
              // subtitle1: TextStyle(
              //   color: AppColors.black,
              //   fontSize: 16.sp, // for text field text
              // ),
              // subtitle2: TextStyle(
              //   color: AppColors.black,
              //   fontSize: 14.sp,
              // ),
              caption: TextStyle(
                color: AppColors.black,
                fontSize: 14.sp,
              ),
              bodyText2: TextStyle(
                color: AppColors.black,
                fontSize: 14.sp,
              ),
            ),
          ),
          initialRoute: AppRoutes.launchScreen,
          getPages: AppRoutes.getPages,
          unknownRoute: GetPage(
            name: '/unknown_route',
            page: () => const UnknownScreen(),
          ),
          initialBinding: StoreBinding(),
          // getPages: [
          //   GetPage(
          //     name: AppRoutes.launchScreen,
          //     page: () => const LaunchScreen(),
          //   ),
          //   GetPage(
          //     name: AppRoutes.onboardingScreen,
          //     page: () => const OnboardingScreen(),
          //   ),
          //   GetPage(
          //     name: AppRoutes.welcomeScreen,
          //     page: () => const WelcomeScreen(),
          //   ),
          //   GetPage(
          //     name: AppRoutes.loginScreen,
          //     page: () => const LoginScreen(),
          //   ),
          //   GetPage(
          //     name: '/forget_password',
          //     page: () => const ForgetPassword(),
          //   ),
          //   GetPage(
          //     name: AppRoutes.registerScreen,
          //     page: () => const RegisterScreen(),
          //   ),
          //   GetPage(
          //     name: AppRoutes.verificationScreen,
          //     page: () => const VerificationScreen(),
          //   ),
          //   GetPage(
          //     name: AppRoutes.homeScreen,
          //     page: () => const HomeScreen(),
          //   ),
          // ],
          translations: AppTranslations(),
          // locale: const Locale('ar'),
          locale: Locale(userLocale),
          fallbackLocale: const Locale('en'),
        );
      },
    );
  }
}
