import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kibrisarabam/core/theme/custom_theme_data.dart';
import 'package:kibrisarabam/product/models/car_card_item.dart';

class CarCardItemWidget extends StatelessWidget {
  final CarCardItem model;
  const CarCardItemWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 140.h,
      width: 430.w,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 4.w, right: 12.w),
            width: 135.w,
            height: 150.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(model.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 268.w,
            margin: EdgeInsets.only(top: 14.h, right: 11.w, bottom: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 68.h,
                  child: Text(
                    model.title,
                    style: CustomThemeData.fontThemes.mPlus1.copyWith(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                    height: 20.h,
                    child: Text(
                      model.model,
                      style: CustomThemeData.fontThemes.mPlus1.copyWith(
                        fontSize: 10.sp,
                        color: Colors.black,
                      ),
                    )),
                Container(
                  width: 268.w,
                  height: 1.h,
                  decoration: BoxDecoration(
                    gradient: CustomThemeData.colorThemes.primaryGradient,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.black,
                          size: 12.sp,
                        ),
                        Text(
                          model.location,
                          style: CustomThemeData.fontThemes.mPlus1.copyWith(
                            fontSize: 12.sp,
                            color: CustomThemeData.colorThemes.textColor2,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${model.price} \$",
                      style: CustomThemeData.fontThemes.mPlus1.copyWith(
                        fontSize: 12.sp,
                        color: CustomThemeData
                            .colorThemes.primaryGradient.colors[1],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
