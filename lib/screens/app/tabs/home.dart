import 'package:e_grocery/api/controllers/home_api_controller.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/get/controllers/home_controller.dart';
import 'package:e_grocery/models/category.dart';
import 'package:e_grocery/models/banner_slider.dart';
import 'package:e_grocery/models/product.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:e_grocery/widgets/category_card.dart';
import 'package:e_grocery/widgets/product_card.dart';
import 'package:e_grocery/widgets/section_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsetsDirectional.only(start: 20.w, bottom: 30.w),
      children: [
        Stack(
          children: [
            SizedBox(
              height: 200.h,
              child: FutureBuilder<List<BannerSlider>?>(
                future: HomeApiController().getSlider(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? PageView.builder(
                          onPageChanged: (index) {
                            homeController.bannerIndex.value = index;
                          },
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: Get.width,
                              height: 180.h,
                              margin: EdgeInsetsDirectional.only(
                                  top: 20.h, end: 20.w),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      snapshot.data![index].imageUrl),
                                ),
                              ),
                            );
                          },
                        )
                      : Shimmer.fromColors(
                          baseColor: AppColors.shimmerBaseColor,
                          highlightColor: AppColors.shimmerHighlightColor,
                          child: Container(
                            width: Get.width,
                            height: 180.h,
                            margin: EdgeInsetsDirectional.only(
                                top: 20.h, end: 20.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.lightGrey,
                            ),
                          ),
                        );
                },
              ),
            ),
            PositionedDirectional(
              bottom: 15.h,
              start: 32.w,
              child: SizedBox(
                height: 5.h,
                child: Center(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => Container(
                          width: index == homeController.bannerIndex.value
                              ? 10.w
                              : 5.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: index == homeController.bannerIndex.value
                                ? AppColors.green
                                : AppColors.grey,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 4.w,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        SectionBar(
          title: 'category'.tr,
          onTap: () async {
            // await HomeApiController().getHome();
            homeController.updatePageIndex(1);
          },
        ),
        SizedBox(
          height: 130.h,
          child: FutureBuilder<List<Category>?>(
              future: HomeApiController().getCategories(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.separated(
                        padding: EdgeInsetsDirectional.only(end: 20.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.subCategoriesScreen,
                                  arguments: {
                                    'cat_id': snapshot.data![index].id,
                                    'cat_name': snapshot.data![index].name,
                                  });
                            },
                            child: CategoryCard(
                              catPicture: snapshot.data![index].imageUrl,
                              catTitle: snapshot.data![index].name,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 14.w,
                          );
                        },
                      )
                    : Shimmer.fromColors(
                        baseColor: AppColors.shimmerBaseColor,
                        highlightColor: AppColors.shimmerHighlightColor,
                        child: ListView.separated(
                          padding: EdgeInsetsDirectional.only(end: 20.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 120.w,
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 14.w,
                            );
                          },
                        ),
                      );
              }),
        ),
        SectionBar(
          title: 'latest_products'.tr,
          onTap: () {
            homeController.updatePageIndex(1);
          },
        ),
        SizedBox(
          height: 250.h,
          child: FutureBuilder<List<Product>?>(
              future: HomeApiController().getLatestProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.separated(
                        padding: EdgeInsetsDirectional.only(end: 20.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            product: snapshot.data![index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 14.w,
                          );
                        },
                      )
                    : Shimmer.fromColors(
                        baseColor: AppColors.shimmerBaseColor,
                        highlightColor: AppColors.shimmerHighlightColor,
                        child: ListView.separated(
                          padding: EdgeInsetsDirectional.only(end: 20.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 150.w,
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 14.w,
                            );
                          },
                        ),
                      );
              }),
        ),
        SectionBar(
          title: 'popular_products'.tr,
          onTap: () {
            homeController.updatePageIndex(1);
          },
        ),
        SizedBox(
          height: 250.h,
          child: FutureBuilder<List<Product>?>(
              future: HomeApiController().getFamousProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.separated(
                        padding: EdgeInsetsDirectional.only(end: 20.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.productsDetails,
                                  arguments: {
                                    'product_id': snapshot.data![index].id,
                                    'product_name': snapshot.data![index].name,
                                  });
                            },
                            child: ProductCard(
                              product: snapshot.data![index],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 14.w,
                          );
                        },
                      )
                    : Shimmer.fromColors(
                        baseColor: AppColors.shimmerBaseColor,
                        highlightColor: AppColors.shimmerHighlightColor,
                        child: ListView.separated(
                          padding: EdgeInsetsDirectional.only(end: 20.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 150.w,
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 14.w,
                            );
                          },
                        ),
                      );
              }),
        ),
      ],
    );
  }
}
