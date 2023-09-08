enum RouteEnums {
  login,
  register,
  home,
  welcome,
  search,
  garage,
  createItemAd,
  mainLandingPage,
  profile;

  @override
  String toString() => routePath;

  String get routePath => "/$name";
}
