import 'package:flutter_riverpod/flutter_riverpod.dart';

final class AllProviders {
  // container as ref
  static final ProviderContainer ref = ProviderContainer();

  static StateProvider<int> bottomBarIndexProvider =
      StateProvider<int>((ref) => 0);
}
