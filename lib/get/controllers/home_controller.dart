import 'package:e_grocery/api/controllers/home_api_controller.dart';
import 'package:e_grocery/models/banner_slider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final pageIndex = 0.obs;
  final isHome = true.obs;
  final bannerIndex = 0.obs;
  final sliderImage = ''.obs;

  void updatePageIndex(int pageIndex) {
    this.pageIndex(pageIndex);
    pageIndex == 0 ? isHome(true) : isHome(false);
  }

  void updateSliderImage(int index) async {
    List<BannerSlider>? slider = await HomeApiController().getSlider();
    sliderImage(slider![index].imageUrl);
  }

  // final category = <Category>[].obs;
  // void updateCategory() async {
  //   // List<Category>? categories = await HomeApiController().getCategories();
  //   category.value = await HomeApiController().getCategories() ?? [];
  // }

}
