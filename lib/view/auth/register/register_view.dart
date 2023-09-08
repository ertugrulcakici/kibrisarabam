import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kibrisarabam/core/services/navigation/navigation_service.dart';
import 'package:kibrisarabam/core/services/navigation/route_enums.dart';
import 'package:kibrisarabam/product/providers/all_providers.dart';
import 'package:kibrisarabam/product/widget/custom_scaffold.dart';

import '../../../core/theme/custom_theme_data.dart';
import '../../../product/enums/image_enums.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  double socialHeight = 0.h;
  double registerButtonHeight = 0.h;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration.zero, () {
        setState(() {
          socialHeight = 135.h;
          registerButtonHeight = 60.h;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resizeToAvoidBottomInset: false,
      child: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _backButton(),
          _welcomeMessage(),
          _infoMessage(),
          _socials(),
          _emailField(),
          _passwordField(),
          _privacyPolicy(),
          _registerButton(),
        ],
      ),
    );
  }

  Widget _backButton() {
    return Container(
      width: 360.w,
      margin: EdgeInsets.only(top: 53.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,
                color: CustomThemeData.colorThemes.textColor1)),
      ),
    );
  }

  Widget _welcomeMessage() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 360.w,
      height: 50.h,
      child: Text("Kayıt ol",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: CustomThemeData.colorThemes.textColor1)),
    );
  }

  Widget _infoMessage() {
    return SizedBox(
      width: 360.w,
      child: Text(
          "Tüm özelliklerimizden faydalanabilmek için lütfen kayıt olun",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: CustomThemeData.colorThemes.textColor2)),
    );
  }

  Widget _socials() {
    return Container(
      margin: EdgeInsets.only(top: 40.h),
      height: 135.h,
      child: Center(
        child: AnimatedContainer(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 500),
          width: 360.w,
          height: socialHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            color: CustomThemeData.colorThemes.primaryDark,
            boxShadow: [
              BoxShadow(
                  color: CustomThemeData.colorThemes.loginSocialsShadowColor,
                  offset: Offset(0, 5.h),
                  blurRadius: 25,
                  spreadRadius: 0),
            ],
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImageEnums.google_login.toImage(width: 54.h, height: 54.h),
                ImageEnums.apple_login.toImage(width: 54.h, height: 54.h),
                ImageEnums.facebook_login.toImage(width: 54.h, height: 54.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailField() {
    return Container(
      margin: EdgeInsets.only(top: 110.h),
      width: 310.w,
      height: 55.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: CustomThemeData.colorThemes.textColor1,
      ),
      child: TextField(
        // center text
        textAlignVertical: TextAlignVertical.center,

        style: CustomThemeData.fontThemes.mPlus1
            .copyWith(color: Colors.black, fontSize: 13.sp),
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.5.h),
          border: InputBorder.none,
          hintText: 'Kullanıcı adı',
          hintStyle: CustomThemeData.fontThemes.mPlus1.copyWith(
              color: Colors.black, fontSize: 13.sp), // TODO: temadan alınacak
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 310.w,
        height: 55.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: CustomThemeData.colorThemes.textColor1,
        ),
        child: TextField(
          // center text
          textAlignVertical: TextAlignVertical.center,
          style: CustomThemeData.fontThemes.mPlus1
              .copyWith(color: Colors.black, fontSize: 13.sp),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.5.h),
            border: InputBorder.none,
            hintText: 'Şifre',
            hintStyle: CustomThemeData.fontThemes.mPlus1.copyWith(
                color: Colors.black, fontSize: 13.sp), // TODO: temadan alınacak
            suffixIcon: Icon(Icons.visibility,
                color: CustomThemeData.colorThemes.primaryDark),
          ),
        ));
  }

  Widget _privacyPolicy() {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(value: true, onChanged: (onChanged) {}),
          SizedBox(width: 25.w),
          Expanded(
            child: Text('Gizlilik sözleşmesini okudum ve kabul ediyorum',
                style: CustomThemeData.fontThemes.mPlus1.copyWith(
                    fontSize: 13.sp,
                    color: CustomThemeData.colorThemes.textColor1)),
          ),
        ],
      ),
    );
  }

  Widget _registerButton() {
    return InkWell(
      onTap: () {
        ref.read(AllProviders.bottomBarIndexProvider.notifier).state = 0;
        NavigationService.instance
            .pushAndRemoveUntil(RouteEnums.mainLandingPage);
      },
      child: AnimatedContainer(
        margin: EdgeInsets.only(top: 70.h),
        duration: const Duration(milliseconds: 500),
        width: 310.w,
        height: registerButtonHeight,
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: CustomThemeData.colorThemes.primaryGradientReversed,
        ),
        child: Center(
          child: Text('Kayıt olun',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: CustomThemeData.colorThemes.textColor1)),
        ),
      ),
    );
  }
}
