import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kibrisarabam/core/services/navigation/navigation_service.dart';
import 'package:kibrisarabam/core/services/navigation/route_enums.dart';

final class Services {
  Services._();
  static final ProviderContainer ref = ProviderContainer();
  static final StateNotifierProvider<NavigationService, List<RouteEnums>>
      navigationServiceProvider =
      StateNotifierProvider<NavigationService, List<RouteEnums>>(
          (ref) => NavigationService());
}
