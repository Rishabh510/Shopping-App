import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: id,
          );
        },
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      footer: GridTileBar(
        leading: IconButton(
          icon: Icon(
            Icons.favorite,
          ),
          onPressed: () {},
          hoverColor: Colors.red,
          color: Colors.blueGrey,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          color: Colors.blueGrey,
          hoverColor: Colors.red,
          onPressed: () {},
        ),
        backgroundColor: Colors.black87,
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
