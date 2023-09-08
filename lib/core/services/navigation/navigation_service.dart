import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kibrisarabam/view/auth/login/login_view.dart';
import 'package:kibrisarabam/view/auth/welcome/welcome_view.dart';
import 'package:kibrisarabam/view/main/home/home_view.dart';
import 'package:kibrisarabam/view/main/main_landing_view.dart';
import 'package:kibrisarabam/view/main/search/search_view.dart';
import 'package:kibrisarabam/view/profile/profile_view.dart';

import '../../../view/auth/register/register_view.dart';
import '../../../view/main/create_item_ad/create_item_ad_view.dart';
import '../services.dart';
import 'route_enums.dart';

class NavigationService extends StateNotifier<List<RouteEnums>> {
  NavigationService() : super([_initialRoute]);

  static NavigationService get instance =>
      Services.ref.read(Services.navigationServiceProvider.notifier);
  static List<RouteEnums> get stateSnapshot =>
      Services.ref.read(Services.navigationServiceProvider);

  Map<String, WidgetBuilder> routes = {
    RouteEnums.home.routePath: (_) => const HomeView(),
    RouteEnums.login.routePath: (_) => const LoginView(),
    RouteEnums.register.routePath: (_) => const RegisterView(),
    RouteEnums.welcome.routePath: (_) => const WelcomeView(),
    RouteEnums.search.routePath: (_) => const SearchView(),
    RouteEnums.garage.routePath: (_) => const HomeView(),
    RouteEnums.createItemAd.routePath: (_) => const CreateItemAdView(),
    RouteEnums.profile.routePath: (_) => const ProfileView(),
    RouteEnums.mainLandingPage.routePath: (_) => const MainLandingView(),
  };
  static const RouteEnums _initialRoute = RouteEnums.mainLandingPage;
  String initialRoute = _initialRoute.routePath;

  // navigator key
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // context getter
  BuildContext get context => navigatorKey.currentContext!;

  Future<void> push(RouteEnums routeName) async {
    state = [...state, routeName];
    navigatorKey.currentState!.pushNamed(routeName.routePath);
  }

  Future<void> pushReplacement(RouteEnums routeName) async {
    state.removeLast();
    state = [...state, routeName];
    navigatorKey.currentState!.pushReplacementNamed(routeName.routePath);
  }

  Future<void> pushAndRemoveUntil(RouteEnums routeName) async {
    state = [routeName];
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName.routePath,
      (_) => false,
    );
  }

  Future<void> pop() async {
    state.removeLast();
    state = [...state];
    navigatorKey.currentState!.pop();
  }

  // can pop
  bool canPop() => navigatorKey.currentState!.canPop();
}
