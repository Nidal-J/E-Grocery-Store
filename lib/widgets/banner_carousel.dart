import 'package:e_grocery/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({
    Key? key,
  }) : super(key: key);

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  int bannerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            onPageChanged: (index) {
              bannerIndex = index;
              setState(() {});
            },
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                width: Get.width,
                height: 180,
                margin: const EdgeInsetsDirectional.only(top: 20, end: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('${AppImages.path}/banner1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: const [
                //     Padding(
                //       padding: EdgeInsetsDirectional.only(start: 7),
                //       child: Text(
                //         'Extreme bump test',
                //         style: TextStyle(
                //           fontSize: 12,
                //           color: AppColors.white,
                //         ),
                //       ),
                //     ),
                //     Text(
                //       'First test! 100km/h extreme bump test',
                //       style: TextStyle(
                //         fontWeight: FontWeight.bold,
                //         color: AppColors.white,
                //       ),
                //     ),
                //     SizedBox(height: 15),
                //   ],
                // ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 35,
          child: SizedBox(
            height: 5,
            width: MediaQuery.of(context).size.width - 20,
            child: Center(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: index == bannerIndex ? 10 : 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: index == bannerIndex
                          ? AppColors.green
                          : AppColors.lightGrey,
                    ),
                    // child: Text('99'),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 3,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
