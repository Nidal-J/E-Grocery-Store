import 'package:e_grocery/get/bindings/cart_binding.dart';
import 'package:e_grocery/get/bindings/auth/forget_binding.dart';
import 'package:e_grocery/get/bindings/home_binding.dart';
import 'package:e_grocery/get/bindings/intro_binding.dart';
import 'package:e_grocery/get/bindings/auth/login_binding.dart';
import 'package:e_grocery/get/bindings/orders_binding.dart';
import 'package:e_grocery/get/bindings/payment_binding.dart';
import 'package:e_grocery/get/bindings/product_binding.dart';
import 'package:e_grocery/get/bindings/profile_binding.dart';
import 'package:e_grocery/get/bindings/auth/register_binding.dart';
import 'package:e_grocery/get/bindings/settings_binding.dart';
import 'package:e_grocery/screens/app/add_new_address.dart';
import 'package:e_grocery/screens/app/add_payment_card.dart';
import 'package:e_grocery/screens/app/addresses_screen.dart';
import 'package:e_grocery/screens/app/cart_checkout.dart';
import 'package:e_grocery/screens/app/cart_screen.dart';
import 'package:e_grocery/screens/app/offers_screen.dart';
import 'package:e_grocery/screens/app/orders_details.dart';
import 'package:e_grocery/screens/app/orders_screen.dart';
import 'package:e_grocery/screens/app/products_screen.dart';
import 'package:e_grocery/screens/app/sub_categories_screen.dart';
import 'package:e_grocery/screens/app/drawer/about_us.dart';
import 'package:e_grocery/screens/app/drawer/contact_us.dart';
import 'package:e_grocery/screens/app/drawer/faqs.dart';
import 'package:e_grocery/screens/app/drawer/help_center.dart';
import 'package:e_grocery/screens/app/drawer/privacy_policy.dart';
import 'package:e_grocery/screens/app/drawer/terms_and_conditions.dart';
import 'package:e_grocery/screens/app/empty_cart.dart';
import 'package:e_grocery/screens/app/home_screen.dart';
import 'package:e_grocery/screens/app/notifications_screen.dart';
import 'package:e_grocery/screens/app/order_empty.dart';
import 'package:e_grocery/screens/app/order_fail.dart';
import 'package:e_grocery/screens/app/order_success.dart';
import 'package:e_grocery/screens/app/payment_cards_screen.dart';
import 'package:e_grocery/screens/app/product_details.dart';
import 'package:e_grocery/screens/app/profile_screen.dart';
import 'package:e_grocery/screens/app/settings_screen.dart';
import 'package:e_grocery/screens/auth/change_password.dart';
import 'package:e_grocery/screens/auth/forget_password.dart';
import 'package:e_grocery/screens/auth/reset_password.dart';
import 'package:e_grocery/screens/auth/verification_screen.dart';
import 'package:e_grocery/screens/intro/launch_screen.dart';
import 'package:e_grocery/screens/auth/login_screen.dart';
import 'package:e_grocery/screens/auth/register_screen.dart';
import 'package:e_grocery/screens/intro/onboarding_screen.dart';
import 'package:e_grocery/screens/intro/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String launchScreen = '/launch_screen';
  static const String onboardingScreen = '/onboarding_screen';
  static const String welcomeScreen = '/welcome_screen';
  static const String loginScreen = '/login_screen';
  static const String forgetPassword = '/forget_password';
  static const String resetPassword = '/new_password';
  static const String changePassword = '/change_password';
  static const String registerScreen = '/register_screen';
  static const String verificationScreen = '/verification_screen';

  static const String homeScreen = '/home_screen';
  static const String subCategoriesScreen = '/sub_categories_screen';
  static const String productsScreen = '/products_screen';
  static const String productsDetails = '/product_details';
  static const String cartScreen = '/cart_screen';
  static const String emptyCart = '/empty_cart';
  static const String cartCheckout = '/cart_checkout';
  static const String addressesScreen = '/addresses_screen';
  static const String addNewAddress = '/add_new_address';
  static const String paymentCardsScreen = '/payment_cards';
  static const String addPaymentCard = '/add_payment_card';
  static const String ordersScreen = '/orders_screen';
  static const String orderDetails = '/order_details';
  static const String orderSuccess = '/order_success';
  static const String orderFail = '/order_fail';
  static const String orderEmpty = '/order_empty';
  static const String offersScreen = '/offers_screen';

  static const String profileScreen = '/profile_screen';
  static const String notificationsScreen = '/notifications_screen';
  static const String settingsScreen = '/settings_screen';

  static const String aboutUs = '/about_us';
  static const String contactUs = '/contact_us';
  static const String faqs = '/faqs';
  static const String helpCenter = '/help_center';
  static const String privacyPolicy = '/privacy_policy';
  static const String termsAndConditions = '/terms_and_conditions';

  static const String unknownScreen = '/unknown_screen';

  static List<GetPage<dynamic>> getPages = [
    GetPage(
      name: launchScreen,
      page: () => const LaunchScreen(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: onboardingScreen,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: registerScreen,
      page: () => RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: forgetPassword,
      page: () => const ForgetPassword(),
      binding: ForgetBinding(),
    ),
    GetPage(
      name: resetPassword,
      page: () => const ResetPassword(),
      binding: ForgetBinding(),
    ),
    GetPage(
      name: changePassword,
      page: () => const ChangePassword(),
    ),
    GetPage(
      name: verificationScreen,
      page: () => const VerificationScreen(),
      binding: ForgetBinding(),
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: subCategoriesScreen,
      page: () => const SubCategoriesScreen(),
    ),
    GetPage(
      name: productsScreen,
      page: () => const ProductsScreen(),
    ),
    GetPage(
      name: productsDetails,
      page: () => const ProductDetails(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: cartScreen,
      page: () => const CartScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: emptyCart,
      page: () => const EmptyCart(),
    ),
    GetPage(
      name: cartCheckout,
      page: () => const CartCheckout(),
    ),
    GetPage(
      name: addressesScreen,
      page: () => const AddressesScreen(),
    ),
    GetPage(
      name: addNewAddress,
      page: () => const AddNewAddress(),
    ),
    GetPage(
      name: paymentCardsScreen,
      page: () => const PaymentCardsScreen(),
    ),
    GetPage(
      name: addPaymentCard,
      page: () => const AddPaymentCard(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: ordersScreen,
      page: () => const OrdersScreen(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: orderDetails,
      page: () => const OrdersDetails(),
      // binding: OrdersBinding(),
    ),
    GetPage(
      name: orderSuccess,
      page: () => const OrderSuccess(),
    ),
    GetPage(
      name: orderFail,
      page: () => const OrderFail(),
    ),
    GetPage(
      name: orderEmpty,
      page: () => const OrderEmepty(),
    ),
    GetPage(
      name: offersScreen,
      page: () => const OffersScreen(),
    ),
    GetPage(
      name: profileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
        name: settingsScreen,
        page: () => const SettingsScreen(),
        binding: SettingsBinding()),
    GetPage(
      name: notificationsScreen,
      page: () => const NotificationsScreen(),
    ),
    GetPage(
      name: aboutUs,
      page: () => const AboutUs(),
    ),
    GetPage(
      name: faqs,
      page: () => const Faqs(),
    ),
    GetPage(
      name: termsAndConditions,
      page: () => const TermsAndConditions(),
    ),
    GetPage(
      name: helpCenter,
      page: () => const HelpCenter(),
    ),
    GetPage(
      name: privacyPolicy,
      page: () => const PrivacyPolicy(),
    ),
    GetPage(
      name: contactUs,
      page: () => const ContactUs(),
    ),
  ];
}
