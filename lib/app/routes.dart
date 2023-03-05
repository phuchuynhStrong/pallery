import 'package:go_router/go_router.dart';
import 'package:pallery/model/setting/enums.dart';
import 'package:pallery/onboarding/onboarding.dart';
import 'package:pallery/product_list/product_list.dart';
import 'package:pallery/settings/bloc/settings_bloc.dart';
import 'package:pallery/settings/view/view.dart';

final router = GoRouter(
  initialLocation: RouteName.main.path,
  routes: [
    GoRoute(
      path: RouteName.main.path,
      name: RouteName.main.value,
      builder: (context, state) => const OnBoardingView(),
      // builder: (context, state) => const StoryBookScreen(),
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
    GoRoute(
      path: RouteName.selectableSubsetting.path,
      name: RouteName.selectableSubsetting.value,
      builder: (context, state) {
        return SelectableSettingView(
          menu: getMenuItemFromString(state.queryParams['menu'].toString()),
          bloc: state.extra! as SettingsBloc,
        );
      },
    )
  ],
);

enum RouteName {
  main('main'),
  onboarding('onboarding'),
  productList('product_list'),
  settings('settings'),
  selectableSubsetting('selectable_subsetting');

  const RouteName(this.value);
  final String value;

  String get path => '/$value';
}
