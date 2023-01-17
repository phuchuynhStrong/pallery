import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pallery/app/app.dart';
import 'package:pallery/l10n/l10n.dart';
import 'package:pallery/product_list/bloc/bloc.dart';

class ProductItem {
  const ProductItem(this.name, this.gradient);

  final String name;
  final Gradient gradient;
}

const List<ProductItem> _kProducts = [
  ProductItem(
    'Pomotify',
    CustomGradients.sanguine,
  ),
  ProductItem('Androidker Blog', CustomGradients.lusciousLime),
  ProductItem(
    'P-Editor',
    CustomGradients.kashmir,
  )
];

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductListBloc>(
      create: (ctx) => ProductListBloc.initial(),
      child: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          return ProductListView(state: state);
        },
      ),
    );
  }
}

class ProductListView extends StatelessWidget {
  const ProductListView({super.key, required this.state});
  final ProductListState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<ProductListBloc>();
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: CustomGradients.cleanMirror,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: Dimens.lg),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        l10n.gallery,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    PopupMenuButton<ProductListPopUpMenu>(
                      onSelected: (value) =>
                          bloc.onPopUpMenuSelected(context, value),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: ProductListPopUpMenu.settings,
                          child: Row(
                            children: [
                              const Icon(Icons.settings),
                              Container(
                                margin: const EdgeInsets.only(left: Dimens.lg),
                                child: Text(l10n.settings),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: ProductListPopUpMenu.help,
                          child: Row(
                            children: [
                              const Icon(Icons.help),
                              Container(
                                margin: const EdgeInsets.only(left: Dimens.lg),
                                child: Text(l10n.help),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Dimens.lg),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, pos) {
                    return ProductListItemView(
                      item: _kProducts[pos],
                    );
                  },
                  itemCount: _kProducts.length,
                  shrinkWrap: true, // only use for short list
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductListItemView extends StatelessWidget {
  const ProductListItemView({super.key, required this.item});
  final ProductItem item;

  double get height => Dimens.lg * 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.only(
        left: Dimens.lg,
        top: Dimens.lg,
      ),
      decoration: BoxDecoration(
        gradient: item.gradient,
      ),
      child: Text(
        item.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
