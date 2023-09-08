import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kibrisarabam/core/services/auth/auth_service.dart';
import 'package:kibrisarabam/core/services/navigation/navigation_service.dart';
import 'package:kibrisarabam/product/providers/all_providers.dart';
import 'package:kibrisarabam/product/widget/custom_scaffold.dart';

import '../../core/services/navigation/route_enums.dart';

class MainLandingView extends ConsumerStatefulWidget {
  const MainLandingView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MainLandingViewState();
}

class _MainLandingViewState extends ConsumerState<MainLandingView> {
  final PageController _pageController = PageController();

  late final ProviderSubscription<int> _subscription;

  @override
  void initState() {
    _subscription = ref.listenManual<int>(AllProviders.bottomBarIndexProvider,
        (previous, next) {
      log("listener. Previous index: $previous, next index: $next");
      if (previous != next) {
        if (next == 0 || next == 1) {
          _pageController.animateToPage(next,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        } else {
          if (!AuthService.isLoggedIn) {
            NavigationService.instance.push(RouteEnums.welcome);
            ref.read(AllProviders.bottomBarIndexProvider.notifier).state =
                previous ?? 0;
            // _pageController.animateToPage(previous ?? 0,
            //     duration: const Duration(milliseconds: 300),
            //     curve: Curves.linear);
          }
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _subscription.close();
    super.dispose();
  }

  final _pageBuilders = [
    (BuildContext context) =>
        NavigationService.instance.routes[RouteEnums.home.routePath]!(context),
    (BuildContext context) => NavigationService
        .instance.routes[RouteEnums.search.routePath]!(context),
    (BuildContext context) => NavigationService
        .instance.routes[RouteEnums.garage.routePath]!(context),
    (BuildContext context) => NavigationService
        .instance.routes[RouteEnums.createItemAd.routePath]!(context),
    (BuildContext context) => NavigationService
        .instance.routes[RouteEnums.profile.routePath]!(context),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isBottomBarActive: true,
      isTopActive: true,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) => _pageBuilders[index](context),
        itemCount: _pageBuilders.length,
        onPageChanged: (value) {
          ref.read(AllProviders.bottomBarIndexProvider.notifier).state = value;
        },
      ),
    );
  }
}
