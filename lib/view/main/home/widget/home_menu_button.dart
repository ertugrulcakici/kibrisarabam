import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/custom_theme_data.dart';
import '../model/home_menu_button_model.dart';

class HomeMenuButton extends StatelessWidget {
  final HomeMenuButtonModel model;
  const HomeMenuButton({
    super.key,
    required this.model,
  });

  TextStyle get _titleStyle => CustomThemeData.fontThemes.mPlus1.copyWith(
      fontSize: model.isLargeTitled ? 26.sp : 14.sp,
      color: CustomThemeData.colorThemes.textColor1);

  TextStyle get _subtitleStyle => CustomThemeData.fontThemes.mPlus1
      .copyWith(fontSize: 12.sp, color: CustomThemeData.colorThemes.textColor2);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: model.x,
      top: model.y,
      height: model.h,
      width: model.w,
      child: Container(
        height: model.h,
        width: model.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 4.h),
              spreadRadius: 5,
              color: const Color.fromRGBO(0, 0, 0, 35))
        ]),
        child: model.logoOnLeft ? _logoOnLeft() : _logoOnTop(),
      ),
    );
  }

  Widget _logoOnLeft() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 70.w, child: model.icon),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: _titleStyle,
                maxLines: 1,
              ),
              Expanded(
                  child:
                      Text(model.subtitle, style: _subtitleStyle, maxLines: 2)),
            ],
          ),
        )
      ],
    );
  }

  Widget _logoOnTop() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              model.icon,
              SizedBox(width: 10.w),
              Expanded(
                child: AutoSizeText(
                  model.title,
                  style: _titleStyle,
                ),
              )
            ],
          ),
          SizedBox(height: 5.h),
          Text(model.subtitle, style: _subtitleStyle),
        ]);
  }
}
