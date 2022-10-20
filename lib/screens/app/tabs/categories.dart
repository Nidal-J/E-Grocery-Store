import 'package:e_grocery/api/controllers/categories_api_controller.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/models/all_categories.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:e_grocery/widgets/shimmers/categories_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);
  // final StoreController _storeController = Get.find<StoreController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 30.h),
      child: Column(
        children: [
          Text(
            'choose_category'.tr,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Expanded(
            child: FutureBuilder<List<AllCategories>?>(
                future: CategoriesApiController().getCategories(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? GridView.builder(
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 12.h,
                            childAspectRatio: 105.w / 120.h,
                          ),
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.subCategoriesScreen,
                                  arguments: {
                                    'cat_id': snapshot.data![index].id,
                                    'cat_name': snapshot.data![index].name,
                                  });
                            },
                            splashColor: AppColors.green,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 47.r,
                                  backgroundColor: AppColors.lightGrey,
                                  child: Image.network(
                                      snapshot.data![index].imageUrl),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Text(
                                  snapshot.data![index].name.toTitleCase(),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const CategoriesShimmer();
                }),
          ),
        ],
      ),
    );
  }
}
