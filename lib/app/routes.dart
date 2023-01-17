import 'package:go_router/go_router.dart';
import 'package:pallery/onboarding/onboarding.dart';
import 'package:pallery/product_list/product_list.dart';
import 'package:pallery/settings/view/view.dart';

final router = GoRouter(
  initialLocation: RouteName.main.path,
  routes: [
    GoRoute(
      path: RouteName.main.path,
      name: RouteName.main.value,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: RouteName.productList.path,
      name: RouteName.productList.value,
      builder: (context, state) => const ProductListPage(),
    ),
    GoRoute(
      path: RouteName.settings.path,
      name: RouteName.settings.value,
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);

enum RouteName {
  main('main'),
  onboarding('onboarding'),
  productList('product_list'),
  settings('settings');

  const RouteName(this.value);
  final String value;

  String get path => '/$value';
}
