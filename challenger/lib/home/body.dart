import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:challenger/constant.dart';
import 'package:challenger/models/product.dart';
import 'package:challenger/home/item_cart.dart';
import 'package:challenger/home/detail/product_detail.dart';

import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  List<CartItem> products = [];

  void initState() {
    getUserData();
    super.initState();
  }

  getUserData() async {
    //print("entro a cargar");
    products = await fetchPost();
    //print("salio a cargar");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text("Shoes", style: Theme.of(context).textTheme.headline5
              //.copyWith(fontWeight: FontWeight.bold),
              ),
        ),
        //Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                      product: products[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsPage(
                                products[index].id, products[index]),
                            /*builder: (context) => DetailsScreen(
                                product: products[index],
                                id: products[index].id),*/
                          )),
                    )),
          ),
        ),
      ],
    );
  }

  Future<List<CartItem>> fetchPost() async {
    final response = await http
        .get(Uri.parse('http://localhost:8080/solicitud/lista_zapatillas'));

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      //print(response.body);
      var data = json.decode(response.body);
      var rest = data['data'] as List;
      //print(rest);
      List<CartItem> list =
          rest.map((json) => CartItem.fromJson(json)).toList();
      //print('entro');
      return list;

      //return Post.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
