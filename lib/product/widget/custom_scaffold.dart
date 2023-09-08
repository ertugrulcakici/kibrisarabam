import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kibrisarabam/core/services/navigation/navigation_service.dart';
import 'package:kibrisarabam/core/theme/custom_theme_data.dart';
import 'package:kibrisarabam/product/constants/app_constants.dart';
import 'package:kibrisarabam/product/widget/custom_bottom_navbar.dart';

class CustomScaffold extends StatelessWidget {
  final bool isFloatingBackground;
  final bool isBottomBarActive;
  final bool isTopActive;
  final bool isWrappedPage;
  final Widget child;
  final bool? resizeToAvoidBottomInset;
  const CustomScaffold({
    super.key,
    this.resizeToAvoidBottomInset,
    this.isBottomBarActive = false,
    this.isFloatingBackground = false,
    this.isTopActive = false,
    this.isWrappedPage = false,
    required this.child,
  });

  double get bodyHeight =>
      (AppConstants.height - topPaddingHeight - bottomNavBarHeight);
  double get bottomNavBarHeight => isWrappedPage
      ? AppConstants.bottomNavBarHeight
      : isBottomBarActive
          ? AppConstants.bottomNavBarHeight
          : 0;
  double get topPaddingHeight => isWrappedPage
      ? AppConstants.topPaddingHeight
      : (isTopActive ? AppConstants.topPaddingHeight : 0);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (NavigationService.instance.canPop()) {
          NavigationService.instance.pop();
          return false;
        }
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: null,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!isWrappedPage)
                Container(
                    height: topPaddingHeight.h,
                    decoration: BoxDecoration(
                        gradient: CustomThemeData.colorThemes.primaryGradient)),
              SizedBox(
                height: bodyHeight.h,
                child: _body(),
              ),
              if (isBottomBarActive && !isWrappedPage)
                SizedBox(
                  height: bottomNavBarHeight.h,
                  child: const CustomBottomNavBar(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        Positioned(
          top: 0,
          width: AppConstants.width.w,
          height: bodyHeight.h,
          child: ColoredBox(color: CustomThemeData.colorThemes.primaryDark),
        ),
        if (isFloatingBackground)
          Positioned(
            top: AppConstants.floatingStartHeight.h - topPaddingHeight.h,
            height: (AppConstants.height - AppConstants.floatingStartHeight).h,
            width: AppConstants.width.w,
            child: Container(
              width: AppConstants.width.w,
              decoration: BoxDecoration(
                gradient: CustomThemeData.colorThemes.primaryGradient,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.r),
                  topRight: Radius.circular(60.r),
                ),
              ),
            ),
          ),
        Positioned.fill(child: child),
      ],
    );
  }
}
