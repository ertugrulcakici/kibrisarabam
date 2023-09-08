import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kibrisarabam/core/services/navigation/navigation_service.dart';
import 'package:kibrisarabam/core/services/navigation/route_enums.dart';
import 'package:kibrisarabam/core/theme/custom_theme_data.dart';
import 'package:kibrisarabam/product/constants/app_constants.dart';
import 'package:kibrisarabam/product/enums/image_enums.dart';
import 'package:kibrisarabam/product/widget/custom_scaffold.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  double _logoLocation = 385.h;
  double _modalSheetLocation = -420.h;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration.zero, () {
        setState(() {
          _logoLocation = 0;
          _modalSheetLocation = 0;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _backButton(),
              _welcomeMessage(),
              _infoMessage(),
              _welcomeImage(),
            ])),
        _bottomModalSheet(),
      ],
    ));
  }

  Widget _backButton() {
    return Container(
        margin: EdgeInsets.only(top: 53.h),
        child: InkWell(
          onTap: () {
            NavigationService.instance.pop();
          },
          child: Icon(Icons.arrow_back_ios,
              color: CustomThemeData.colorThemes.textColor1),
        ));
  }

  Widget _welcomeMessage() {
    return Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Text('Hoşgeldiniz',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: CustomThemeData.colorThemes.textColor1)));
  }

  Widget _infoMessage() {
    return Container(
        margin: EdgeInsets.zero,
        child: Text(
            'Kıbrıs Arabam\'a hoşgeldiniz. Lütfen giriş yapın veya kayıt olun.',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: CustomThemeData.colorThemes.textColor2,
                )));
  }

  Widget _welcomeImage() {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: ImageEnums.welcome_image
            .toImage(fit: BoxFit.cover, width: double.infinity, height: 190.h));
  }

  Widget _appLogo() {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(ImageEnums.logo.path),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.normal,
            color: Colors.black,
            blurRadius: 20,
            spreadRadius: 2,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
    );
  }

  Widget _bottomModalSheet() {
    return SizedBox(
      height: 505.h,
      width: AppConstants.width.w,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1500),
            curve: Curves.easeInOut,
            bottom: _modalSheetLocation,
            left: 0,
            right: 0,
            child: Container(
              height: 420.h,
              width: 430.w,
              decoration: BoxDecoration(
                gradient: CustomThemeData.colorThemes.primaryGradientReversed,
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20.r), right: Radius.circular(20.r)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _socials(),
                  _loginViaEmailText(),
                  _registerButton(),
                  _alreadyHaveAccount(),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 1500),
              curve: Curves.easeInOut,
              top: _logoLocation,
              width: 120.h,
              left: AppConstants.width / 2 - 60.h,
              child: _appLogo())
        ],
      ),
    );
  }

  Widget _socials() {
    return Container(
      margin: EdgeInsets.only(top: 70.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ImageEnums.google_login.toImage(width: 54.h, height: 54.h),
          ImageEnums.apple_login.toImage(width: 54.h, height: 54.h),
          ImageEnums.facebook_login.toImage(width: 54.h, height: 54.h),
        ],
      ),
    );
  }

  Widget _loginViaEmailText() {
    return Container(
      margin: EdgeInsets.only(top: 40.h),
      child: Text('Ya da e-posta ile giriş yapın',
          style: CustomThemeData.fontThemes.mPlus1.copyWith(
              fontSize: 15.sp,
              color: CustomThemeData.colorThemes.textColor1,
              decoration: TextDecoration.underline)),
    );
  }

  Widget _registerButton() {
    return InkWell(
      onTap: () {
        NavigationService.instance.push(RouteEnums.register);
      },
      child: Container(
        margin: EdgeInsets.only(top: 40.h),
        height: 60.h,
        width: 310.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: CustomThemeData.colorThemes.primaryGradientReversed,
        ),
        child: Center(
          child: Text('Kayıt Ol',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: CustomThemeData.colorThemes.textColor1)),
        ),
      ),
    );
  }

  Widget _alreadyHaveAccount() {
    return Container(
      margin: const EdgeInsets.only(top: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Zaten hesabınız var mı?',
              style: CustomThemeData.fontThemes.mPlus1.copyWith(
                  fontSize: 13.sp,
                  color: CustomThemeData.colorThemes.textColor1)),
          TextButton(
            onPressed: () {
              NavigationService.instance.push(RouteEnums.login);
            },
            child: Text('Giriş Yap',
                style: CustomThemeData.fontThemes.mPlus1.copyWith(
                  color: CustomThemeData.colorThemes.textColor2,
                  decoration: TextDecoration.underline,
                )),
          ),
        ],
      ),
    );
  }
}
