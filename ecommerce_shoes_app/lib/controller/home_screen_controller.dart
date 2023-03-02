import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce_shoes_app/models/home_screen_model/brand_banner_model.dart';
import 'package:ecommerce_shoes_app/models/home_screen_model/featured_product_model.dart';
import 'package:ecommerce_shoes_app/models/home_screen_model/testimonial_model.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_shoes_app/constants/api_url.dart';
import 'package:ecommerce_shoes_app/models/home_screen_model/banner_model.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;

  RxList<BannerDetails> bannerLists = RxList();
  RxList<FeaturedProductDetails> featuredProductLists = RxList();
  RxList<TestimonialDetails> testimonialLists = RxList();
  List<BrandBanner> brandBannerList = [];

  Future<void> getBannerFunction() async {
    isLoading(true);
    String url = ApiUrl.bannerApi;
    log('Url : $url');

    try {
      http.Response response = await http.get(Uri.parse(url));
      // log('Banner Body : ${response.body}');

      BannerData bannerList = BannerData.fromJson(json.decode(response.body));
      isStatus = bannerList.success.obs;

      if (isStatus.value) {
        bannerLists = bannerList.data.obs;
        log('bannerLists: $bannerLists');
      } else {
        log('Banner False False');
      }
    } catch (e) {
      log('Banner Error : $e');
    }

    await getFeaturedProductFunction();
  }

  Future<void> getFeaturedProductFunction() async {
    isLoading(true);
    String url = ApiUrl.featuredProductApi;
    log('Url : $url');

    try {
      http.Response response = await http.get(Uri.parse(url));
log('Featured Product Body : ${response.body}');
      FeaturedProductData featuredProductData =
          FeaturedProductData.fromJson(json.decode(response.body));
      
      isStatus = featuredProductData.success.obs;

      if (isStatus.value) {
        featuredProductLists = featuredProductData.data.obs;
      } else {
        print('FeaturedProduct False False');
      }
    } catch (e) {
      log('FeaturedProduct Error : $e');
    }

    await getTestimonialFunction();
  }

  Future<void> getTestimonialFunction() async {
    isLoading(true);
    String url = ApiUrl.testimonialApi;
    log('Url : $url');

    try {
      http.Response response = await http.get(Uri.parse(url));
      // print('Response1 : ${response.statusCode}');
      // print('Testimonial Response2 : ${response.body}');

      TestimonialsModel testimonialsModel =
          TestimonialsModel.fromJson(json.decode(response.body));
      isStatus = testimonialsModel.success.obs;
      // print('Response Bool : ${testimonialData.success}');
      // print('isStatus : $isStatus');

      if (isStatus.value) {
        // print('True True');
        testimonialLists = testimonialsModel.data.obs;
      } else {
        print('Testimonial False False');
      }
    } catch (e) {
      print('Testimonial Error : $e');
    } finally {
      //isLoading(false);
      await getBrandBannerFunction();
    }
  }

  Future<void> getBrandBannerFunction() async {
    isLoading(true);
    String url = ApiUrl.getBrandBannerApi;
    log('Url : $url');

    try {
      http.Response response = await http.get(Uri.parse(url));

      GetBrandBannerModel getBrandBannerModel =
          GetBrandBannerModel.fromJson(json.decode(response.body));
      isStatus = getBrandBannerModel.success.obs;

      if (isStatus.value) {
        brandBannerList = getBrandBannerModel.data.obs;
        log('brandBannerList: $brandBannerList');
      } else {
        log('Brand Banner False False');
      }
    } catch (e) {
      log('Brand Banner Error : $e');
    }
    //  finally {
    //   isLoading(false);
    // }

    isLoading(false);
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  initMethod() async {
    await getBannerFunction();
  }
}
