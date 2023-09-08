import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kibrisarabam/core/theme/custom_theme_data.dart';
import 'package:kibrisarabam/product/constants/app_constants.dart';
import 'package:kibrisarabam/product/constants/temp_data.dart';
import 'package:kibrisarabam/product/enums/image_enums.dart';

import 'widget/home_menu_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return Stack(
      children: [
        _backgroundImage(),
        _backgroundGradient(),
        _logo(),
        //
        ...TempData.homeMenuButtons
            .map((e) => HomeMenuButton(model: e))
            .toList()
      ],
    );
  }

  Widget _backgroundImage() => Positioned(
        top: 17.h,
        child: ImageEnums.home_page_car_picture
            .toImage(width: AppConstants.width.w, height: 375.h),
      );

  Widget _backgroundGradient() => Positioned(
        top: 56.h,
        height: 753.h,
        width: AppConstants.width.w,
        child: Container(
          decoration: BoxDecoration(
              gradient: CustomThemeData.colorThemes.primaryGradient,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60.r),
                topRight: Radius.circular(215.r),
              )),
        ),
      );

  Widget _logo() => Positioned(
        top: 53.h,
        right: 35.w,
        child: ImageEnums.logo.toImage(width: 120.h, height: 120.h),
      );
}
