import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/get/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavItem extends StatelessWidget {
  BottomNavItem({
    required IconData icon,
    required String title,
    required int index,
    Key? key,
  })  : _icon = icon,
        _title = title,
        _index = index,
        super(key: key);
  final IconData _icon;
  final String _title;
  final int _index;
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            _icon,
            size: 30,
            color: homeController.pageIndex.value == _index
                ? AppColors.green
                : AppColors.black.withOpacity(0.4),
          ),
          Text(
            _title,
            style: TextStyle(
              color: homeController.pageIndex.value == _index
                  ? AppColors.green
                  : AppColors.black.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}
