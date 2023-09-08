import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kibrisarabam/core/theme/custom_theme_data.dart';
import 'package:kibrisarabam/product/constants/app_constants.dart';
import 'package:kibrisarabam/product/enums/image_enums.dart';
import 'package:kibrisarabam/product/providers/all_providers.dart';

class CustomBottomNavBar extends ConsumerStatefulWidget {
  const CustomBottomNavBar({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends ConsumerState<CustomBottomNavBar> {
  final double _size = 26.r; // TODO: buna bak

  final List<ImageEnums> _selecteds = [
    ImageEnums.bottom_navbar_home_selected,
    ImageEnums.bottom_navbar_search_selected,
    ImageEnums.bottom_navbar_car_selected,
    ImageEnums.bottom_navbar_add_selected,
    ImageEnums.bottom_navbar_profile_selected,
  ];

  final List<ImageEnums> _unselecteds = [
    ImageEnums.bottom_navbar_home_unselected,
    ImageEnums.bottom_navbar_search_unselected,
    ImageEnums.bottom_navbar_car_unselected,
    ImageEnums.bottom_navbar_add_unselected,
    ImageEnums.bottom_navbar_profile_unselected,
  ];

  @override
  Widget build(BuildContext context) {
    // double height = (60 + MediaQuery.paddingOf(context).bottom).h;
    double height = 76.h;
    return Container(
      color: CustomThemeData.colorThemes.primaryDark,
      width: AppConstants.width.w,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          _bottomBarItem(0),
          _bottomBarItem(1),
          _bottomBarItem(2),
          _bottomBarItem(3),
          _bottomBarItem(4),
        ],
      ),
    );
  }

  Widget _bottomBarItem(int index) {
    return InkWell(
      onTap: () =>
          ref.read(AllProviders.bottomBarIndexProvider.notifier).state = index,
      child: SizedBox(
        // height: _size,
        width: AppConstants.width.w / 5,
        // color: Colors.green,
        child: Center(
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState:
                ref.watch(AllProviders.bottomBarIndexProvider) == index
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
            firstChild: _selecteds[index].toImage(width: _size, height: _size),
            secondChild:
                _unselecteds[index].toImage(width: _size, height: _size),
          ),
        ),
      ),
    );
  }
}
