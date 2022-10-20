import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/get/controllers/orders_controller.dart';
import 'package:e_grocery/screens/app/all_orders.dart';
import 'package:e_grocery/screens/app/previous_orders.dart';
import 'package:e_grocery/screens/app/running_orders.dart';

import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ordersController = Get.find<OrdersController>();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBg,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: const GetBackButton(),
          title: Text('my_orders'.tr),
          bottom: TabBar(
            labelStyle: TextStyle(
              color: AppColors.green,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            labelColor: AppColors.green,
            unselectedLabelColor: AppColors.grey,
            indicatorColor: AppColors.green,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('All '),
                    Text(
                      '(44)',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('ٌRunning '),
                    Text(
                      '(44)',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Previous '),
                    Text(
                      '(44)',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.r),
          child: const TabBarView(
            children: [
              AllOrders(),
              RunningOrders(),
              PreviousOrders(),
            ],
          ),
        ),
      ),
    );
  }
}
