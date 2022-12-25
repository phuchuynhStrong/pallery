import 'package:flutter/material.dart';
import 'package:pallery/app/app.dart';

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

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: CustomGradients.cleanMirror,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: Dimens.lg),
                child: const Text(
                  'Gallery',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
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
