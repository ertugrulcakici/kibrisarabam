// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum ImageTypes {
  ico,
  png;
}

enum ImageEnums {
  apple_login(ImageTypes.ico),
  facebook_login(ImageTypes.ico),
  google_login(ImageTypes.ico),
  logo(ImageTypes.png),
  welcome_image(ImageTypes.png),
  // bottom bar icons
  bottom_navbar_home_selected(ImageTypes.ico),
  bottom_navbar_home_unselected(ImageTypes.ico),
  bottom_navbar_search_selected(ImageTypes.ico),
  bottom_navbar_search_unselected(ImageTypes.ico),
  bottom_navbar_car_selected(ImageTypes.ico),
  bottom_navbar_car_unselected(ImageTypes.ico),
  bottom_navbar_add_selected(ImageTypes.ico),
  bottom_navbar_add_unselected(ImageTypes.ico),
  bottom_navbar_profile_selected(ImageTypes.ico),
  bottom_navbar_profile_unselected(ImageTypes.ico),
  // home page
  home_page_car_picture(ImageTypes.png),
  home_page_search_item_ad(ImageTypes.ico),
  home_page_how_much_my_car(ImageTypes.ico),
  home_page_create_item_ad(ImageTypes.ico),
  home_page_suggest_me_car(ImageTypes.ico),
  home_page_zero_km_car(ImageTypes.ico),
  home_page_trink_sell_car(ImageTypes.ico),
  home_page_top_galleries(ImageTypes.ico),

  // search page
  search_page_icon(ImageTypes.ico),

  wd41(ImageTypes.png),
  sport_car(ImageTypes.png),
  mvp(ImageTypes.png),
  classic_car(ImageTypes.png),
  cargo(ImageTypes.png),
  car(ImageTypes.png),
  camper_van(ImageTypes.png),

  alfa_romeo(ImageTypes.png),
  bmw(ImageTypes.png),
  ford(ImageTypes.png),
  jaguar(ImageTypes.png),
  jeep(ImageTypes.png),
  ;

  const ImageEnums(this._imageType);

  final ImageTypes _imageType;
  String get _imagePath => switch (_imageType) {
        ImageTypes.ico => "assets/icons/",
        ImageTypes.png => "assets/images/",
      };

  String get _extension => ".${_imageType.name}";

  String get path => _imagePath + name + _extension;
  Image toImage({BoxFit fit = BoxFit.contain, double? width, double? height}) =>
      Image.asset(
        path,
        fit: fit,
        width: width,
        height: height,
      );
}
