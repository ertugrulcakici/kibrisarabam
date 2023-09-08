import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/custom_theme_data.dart';
import '../../../../product/models/car_search_item.dart';

class SearchRowItem extends StatefulWidget {
  final CarSearchItemModel item;
  final Animation<double> animation;
  final Function(List<CarSearchItemModel>) onTap;
  const SearchRowItem(
      {super.key,
      required this.item,
      required this.animation,
      required this.onTap});

  @override
  State<SearchRowItem> createState() => _SearchRowItemState();
}

class _SearchRowItemState extends State<SearchRowItem> {
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: widget.animation.drive(CurveTween(curve: Curves.easeIn)),
      child: InkWell(
        onTap: () {
          widget.onTap(widget.item.children);
        },
        // () {
        //   // setState(() {
        //   //   title = widget.item.title;
        //   // });
        //   // _resetAllAndBuildList(TempData.carSearchItems2);
        // },
        child: Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h),
          decoration: BoxDecoration(
            color: CustomThemeData.colorThemes.primaryDark,
            borderRadius: BorderRadius.circular(15.r),
          ),
          height: 50.h,
          width: 390.w,
          child: Row(
            children: [
              if (widget.item.icon != null)
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        bottomLeft: Radius.circular(15.r),
                      )),
                  width: 63.w,
                  height: 50.h,
                  child: Center(child: widget.item.icon!),
                ),
              SizedBox(width: 20.w),
              Text(widget.item.title,
                  style: CustomThemeData.fontThemes.mPlus1.copyWith(
                    fontSize: 16.sp,
                    color: CustomThemeData.colorThemes.textColor1,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
