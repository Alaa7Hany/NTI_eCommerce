import 'package:flutter/material.dart';
import 'package:nti_ecommerce/core/helper/nav_helper.dart';
import 'package:nti_ecommerce/core/data/models/product_model.dart';

import '../../features/home/views/product_view.dart';
import 'product_card.dart';

class GridOfProducts extends StatelessWidget {
  const GridOfProducts({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items per row
        crossAxisSpacing: 15, // space between columns
        mainAxisSpacing: 15, // space between rows
        childAspectRatio: .5, // height vs width ratio
      ),
      scrollDirection: Axis.vertical,

      itemCount: products.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            NavHelper.push(() => ProductView(productModel: products[index]));
          },
          child: ProductCard(product: products[index]),
        );
      },
    );
  }
}
