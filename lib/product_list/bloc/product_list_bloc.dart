import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pallery/app/routes.dart';
import 'package:pallery/product_list/product_list.dart';

class ProductListState {}

class ProductListEvent {
  ProductListEvent(this.type, this.data);

  final ProductListEventType type;
  final dynamic data;
}

enum ProductListEventType { selectPopupItem }

enum ProductListPopUpMenu { settings, help }

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc(super.initialState);

  factory ProductListBloc.initial() => ProductListBloc(ProductListState());

  void onSettingsPressed(BuildContext context) {
    context.pushNamed(RouteName.settings.value);
  }

  void onPopUpMenuSelected(BuildContext context, ProductListPopUpMenu value) {
    if (value == ProductListPopUpMenu.settings) {
      onSettingsPressed(context);
    }
  }

  void onProductItemPressed(BuildContext context, ProductItem item) {
    context.pushNamed(item.path);
  }
}
