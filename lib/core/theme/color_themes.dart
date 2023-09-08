part of "custom_theme_data.dart";

final class CustomColorThemes {
  // static _CustomColorThemes? _instance;
  // static _CustomColorThemes get instance =>
  //     _instance ??= _CustomColorThemes._();
  CustomColorThemes._();

  Color primaryDark = const Color(0xFF161525);
  LinearGradient primaryGradient = const LinearGradient(
    colors: [
      Color.fromRGBO(71, 53, 165, 100),
      Color.fromRGBO(120, 53, 159, 46),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  LinearGradient primaryGradientReversed = const LinearGradient(
    colors: [
      Color.fromRGBO(120, 53, 159, 46),
      Color.fromRGBO(71, 53, 165, 100),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  Color textColor1 = const Color(0xFFFFFFFF);
  Color textColor2 = const Color(0xFFB6B6B6);

  // Customs
  Color loginSocialsShadowColor = const Color.fromRGBO(120, 53, 158, 46);
}
