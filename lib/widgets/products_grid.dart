import 'package:flutter/material.dart';
import 'product_item.dart';
import '../provider/products.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        //we dont need c here
        // so we can use ChangeNotifierProvider.values and put values: products[i
        // instead of builder function.
        builder: (c) => products[i],
        child: ProductItem(
//          products[i].id,
//          products[i].title,
//          products[i].imageUrl,
            ),
      ),
      padding: EdgeInsets.all(10),
      itemCount: products.length,
    );
  }
}
