import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kibrisarabam/core/utils/extensions/ui_extensions.dart';
import 'package:kibrisarabam/product/enums/image_enums.dart';
import 'package:kibrisarabam/view/main/home/model/home_menu_button_model.dart';

import '../models/car_search_item.dart';

final class TempData {
  TempData._();

  static final List<CarSearchItemModel> carSearchItems1 = [
    CarSearchItemModel(
        icon: ImageEnums.classic_car.toImage(
          width: 30.w,
          height: 28.h,
        ),
        children: carSearchItems2,
        title: "Otomobil"),
    CarSearchItemModel(
        icon: ImageEnums.camper_van.toImage(
          width: 30.w,
          height: 28.h,
        ),
        title: "Pickup & Suv"),
    CarSearchItemModel(
        icon: ImageEnums.cargo.toImage(
          width: 30.w,
          height: 28.h,
        ),
        title: "Minivan & Panelvan"),
    CarSearchItemModel(
        icon: ImageEnums.mvp.toImage(
          width: 30.w,
          height: 28.h,
        ),
        title: "Ticari Araçlar"),
    CarSearchItemModel(
        icon: ImageEnums.car.toImage(
          width: 30.w,
          height: 28.h,
        ),
        title: "Araç ara"),
    CarSearchItemModel(
        icon: ImageEnums.classic_car.toImage(
          width: 30.w,
          height: 28.h,
        ),
        title: "Klasik Araçlar"),
    // Todo: çok item için uyarlanacak
    // CarSearchItem(
    //     icon: ImageEnums.camper_van.toImage(
    //       width: 30.w,
    //       height: 28.h,
    //     ),
    //     title: "Karavan"),
    // CarSearchItem(
    //     icon: ImageEnums.sport_car.toImage(
    //       width: 30.w,
    //       height: 28.h,
    //     ),
    //     title: "Modifiyeli Araçlar"),
    // CarSearchItem(
    //     icon: ImageEnums.sport_car.toImage(
    //       width: 30.w,
    //       height: 28.h,
    //     ),
    //     title: "Modifiyeli Araçlar"),
    // CarSearchItem(
    //     icon: ImageEnums.sport_car.toImage(
    //       width: 30.w,
    //       height: 28.h,
    //     ),
    //     title: "Modifiyeli Araçlar"),
    // CarSearchItem(
    //     icon: ImageEnums.sport_car.toImage(
    //       width: 30.w,
    //       height: 28.h,
    //     ),
    //     title: "Modifiyeli Araçlar"),
    // CarSearchItem(
    //     icon: ImageEnums.sport_car.toImage(
    //       width: 30.w,
    //       height: 28.h,
    //     ),
    //     title: "Modifiyeli Araçlar"),
  ];

  static final List<CarSearchItemModel> carSearchItems2 = [
    CarSearchItemModel(
        icon: ImageEnums.alfa_romeo.toImage(
          width: 30.w,
          height: 28.h,
        ),
        title: "Alfa Romeo"),
    CarSearchItemModel(
        icon: ImageEnums.bmw.toImage(
          width: 30.w,
          height: 28.h,
        ),
        children: carSearchItems3,
        title: "BMW"),
    CarSearchItemModel(
        icon: ImageEnums.ford.toImage(
          width: 30.w,
          height: 28.h,
        ),
        title: "Ford"),
    CarSearchItemModel(
        icon: ImageEnums.jaguar.toImage(
          width: 30.w,
          height: 28.h,
        ),
        title: "Jaguar"),
    CarSearchItemModel(
        icon: ImageEnums.jeep.toImage(
          width: 30.w,
          height: 28.h,
        ),
        title: "Jeep"),
  ];

  static final List<CarSearchItemModel> carSearchItems3 = [
    CarSearchItemModel(title: "1. Serisi"),
    CarSearchItemModel(title: "2. Serisi"),
    CarSearchItemModel(title: "3. serisi"),
  ];

  static final List<HomeMenuButtonModel> homeMenuButtons = [
    HomeMenuButtonModel(
      title: "İlan ara",
      subtitle: "Hayalinde ki araca hemen ulaş",
      logoOnLeft: false,
      isLargeTitled: true,
      icon: ImageEnums.home_page_search_item_ad.toImage(
        width: 30.w,
        height: 28.h,
      ),
      x: 20.w,
      y: 150.setForTop.h,
      w: 220.w,
      h: 120.h,
    ),
    HomeMenuButtonModel(
        title: "Arabam kaç para",
        subtitle: "Kolayca ilan ver binlerce alıcıya ulaş",
        icon: ImageEnums.home_page_how_much_my_car.toImage(
          width: 40.w,
          height: 37.h,
        ),
        logoOnLeft: false,
        isLargeTitled: false,
        x: 20.w,
        y: 290.setForTop.h,
        w: 150.w,
        h: 120.h),
    HomeMenuButtonModel(
        title: "İlan ver",
        subtitle: "Kolayca ilan ver binlerce alıcıya ulaş",
        icon: ImageEnums.home_page_create_item_ad.toImage(
          width: 40.w,
          height: 36.h,
        ),
        logoOnLeft: false,
        isLargeTitled: true,
        x: 190.w,
        y: 290.setForTop.h,
        w: 220.w,
        h: 120.h),
    HomeMenuButtonModel(
        title: "Bana araç öner",
        subtitle: "Hayalinizdeki aracı biz düşünelim",
        icon: ImageEnums.home_page_suggest_me_car.toImage(
          width: 40.w,
          height: 37.h,
        ),
        logoOnLeft: false,
        isLargeTitled: false,
        x: 20.w,
        y: 430.setForTop.h,
        w: 150.w,
        h: 120.h),
    HomeMenuButtonModel(
        title: "Sıfır KM Araçlar",
        subtitle: "Sıfır kilometre araçlara gözatın",
        icon: ImageEnums.home_page_zero_km_car.toImage(
          width: 42.w,
          height: 40.h,
        ),
        logoOnLeft: false,
        isLargeTitled: true,
        x: 190.w,
        y: 430.setForTop.h,
        w: 220.w,
        h: 120.h),
    HomeMenuButtonModel(
        title: "Trink Sat",
        subtitle:
            "Aracını değerinde, zahmetsiz ve güvenle sat, paran anında cebinde",
        icon: ImageEnums.home_page_trink_sell_car.toImage(
          width: 70.r, //  TODO: burası denenecek
          height: 70.r,
        ),
        logoOnLeft: true,
        isLargeTitled: true,
        x: 20.w,
        y: 570.setForTop.h,
        w: 390.w,
        h: 120.h),
    HomeMenuButtonModel(
        title: "En seçkin galeriler",
        subtitle: "En seçkin galerilere bak hayalindeki araçlara anında ulaş",
        icon: ImageEnums.home_page_top_galleries.toImage(
          width: 40.r, // TODO: burası denenecek
          height: 40.r,
        ),
        logoOnLeft: true,
        isLargeTitled: true,
        x: 20.w,
        y: 710.setForTop.h,
        w: 390.w,
        h: 120.h),
  ];
}
