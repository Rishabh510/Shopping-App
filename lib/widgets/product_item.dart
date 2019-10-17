import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';

class ProductItem extends StatelessWidget {
//  final String id;
//  final String title;
//  final String imageUrl;
//
//  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: product.id,
          );
        },
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      footer: GridTileBar(
        leading: IconButton(
          icon: Icon(
            Icons.favorite,
          ),
          onPressed: () {
            product.toggleFavorite();
          },
          hoverColor: Colors.redAccent,
          color: product.isFavorite ? Colors.red : Colors.blueGrey,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          color: Colors.blueGrey,
          hoverColor: Colors.redAccent,
          onPressed: () {},
        ),
        backgroundColor: Colors.black87,
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
