import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_allTests/api.services.dart';
import './Product.dart';

/*final List<Product> products = [
  Product(
      reference: "Adidas",
      description: "Ultra Boost og",
      idCategorie: 1,
      prix: 100),
  Product(
      reference: "Adidas",
      description: "Ultra Boost og",
      idCategorie: 1,
      prix: 100),
  Product(
      reference: "Adidas",
      description: "Ultra Boost og",
      idCategorie: 1,
      prix: 100),
  Product(
      reference: "Adidas",
      description: "Ultra Boost og",
      idCategorie: 1,
      prix: 100),
];*/

class AllTests extends StatefulWidget {
  @override
  AllTestsState createState() => AllTestsState();
}

class AllTestsState extends State<AllTests> {
  List<Product> products;
  final _savedProducts = Set<Product>();

  getProducts() {
    APIServices.fetchProducts().then((response) {
      Iterable list = json.decode(response.body);
      List<Product> lp = List<Product>();
      lp = list.map((e) => Product.fromObject(e)).toList();
      setState(() {
        products = lp;
      });
    });
  }

  Widget _buildList() {
    getProducts();
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: products.length,
        itemBuilder: (context, item) {
          return _buildrow(products[item]);
        });
  }

  Widget _buildrow(Product p) {
    final alreadySaved = _savedProducts.contains(p);

    return ListTile(
      /*leading: CircleAvatar(
          backgroundImage:
              AssetImage(p.image) // no matter how big it is, it won't overflow
          ),*/
      title: Text(
        p.reference,
        style: TextStyle(fontSize: 18),
      ),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _savedProducts.remove(p);
          } else {
            _savedProducts.add(p);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _savedProducts.map((Product p) {
        return ListTile(
          /*leading: CircleAvatar(
              backgroundImage: AssetImage(
                  p.image) // no matter how big it is, it won't overflow
              ),*/
          title: Text(
            p.description + " " + p.prix.toString() + "DHS",
            style: TextStyle(fontSize: 16.0),
          ),
        );
      });
      final List<Widget> divided =
          ListTile.divideTiles(tiles: tiles, context: context).toList();

      return Scaffold(
        appBar: AppBar(title: Text('Saved Products')),
        body: ListView(children: divided),
      );
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Ydek Store'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
          ],
        ),
        body: _buildList());
  }
}
