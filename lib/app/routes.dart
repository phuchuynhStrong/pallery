import 'package:go_router/go_router.dart';
import 'package:pallery/onboarding/onboarding.dart';
import 'package:pallery/product_list/product_list.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RouteName.main.value,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: RouteName.productList.value,
      builder: (context, state) => const ProductListView(),
    )
  ],
);

enum RouteName {
  main('/'),
  onboarding('/onboarding'),
  productList('/product_list');

  const RouteName(this.value);
  final String value;
}
