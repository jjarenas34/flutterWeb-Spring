import 'package:challenger/models/product.dart';
import 'package:challenger/models/size.dart';
import 'package:flutter/material.dart';
import 'package:challenger/util/custom_text_style.dart';
import 'package:challenger/util/custom_util.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

//import 'CartPage.dart';

class ProductDetailsPage extends StatefulWidget {
  //String heroTag;
  int id;
  CartItem product;
  ProductDetailsPage(this.id, this.product);

  @override
  _ProductDetailsPageState createState() =>
      _ProductDetailsPageState(id, product);
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with TickerProviderStateMixin<ProductDetailsPage> {
  List<Color> listColor = [];
  List<SizeShoe> listSize = [];
  int selectedColor = -1;

  var selectedSize = -1;

  var id;
  CartItem product;
  _ProductDetailsPageState(this.id, this.product);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addColor();
    //addSize();
    getData(id);
  }

  getData(int id) async {
    //print("entro a cargar");
    listSize = await fetchPost(id);
    //print("salio a cargar");
    setState(() {});
  }

  setData(int id, int idSize) async {
    //print("entro a cargar");
    await addCart(id, idSize);
    //print("salio a cargar");
    setState(() {});
  }

  void addColor() {
    listColor.add(Colors.red);
    listColor.add(Colors.green);
    listColor.add(Colors.yellow);
    listColor.add(Colors.black);
    listColor.add(Colors.teal);
    listColor.add(Colors.blue);
  }

  @override
  Widget build(BuildContext context) {
    var halfOfScreen = MediaQuery.of(context).size.height / 1.5;
    print("color seleccionado" + selectedColor.toString());
    print("talla seleccionado" + selectedSize.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      //resizeToAvoidBottomPadding: false,
      body: Builder(builder: (context) {
        return Container(
          height: double.infinity,
          child: Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Hero(
                  tag: id,
                  child: Image(
                    image: AssetImage(product.imageUrl),
                    height: halfOfScreen,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      height: 28,
                      width: 32,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        iconSize: 14,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                          ),
                          /*Container(
                            height: 28,
                            width: 32,
                            child: IconButton(
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                              onPressed: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) => CartPage()));
                              },
                              iconSize: 14,
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade400),
                          ),*/
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: productDetailsSection(),
              )
            ],
          ),
        );
      }),
    );
  }

  productDetailsSection() {
    return Container(
      padding: EdgeInsets.all(8),
      height: 320,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Text(
                  product.title + " - " + product.model,
                  style: CustomTextStyle.textFormFieldSemiBold
                      .copyWith(color: Colors.black),
                ),
              ),
              IconButton(icon: Icon(Icons.close), onPressed: () {})
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 8),
            alignment: Alignment.topLeft,
            child: Text(
              "Colour",
              textAlign: TextAlign.start,
              style: CustomTextStyle.textFormFieldBold
                  .copyWith(color: Colors.black.withOpacity(0.8), fontSize: 12),
            ),
          ),
          Utils.getSizedBox(height: 8),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 40),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return createColorItem(index);
              },
              itemCount: listColor.length,
            ),
          ),
          Utils.getSizedBox(height: 16),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 8),
            child: Text(
              "Size",
              style: CustomTextStyle.textFormFieldMedium
                  .copyWith(color: Colors.black.withOpacity(0.8), fontSize: 12),
            ),
          ),
          Utils.getSizedBox(height: 8),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 40),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return createSizeItem(index);
              },
              itemCount: listSize.length,
            ),
          ),
          Utils.getSizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Text(
                  "Total",
                  style: CustomTextStyle.textFormFieldMedium
                      .copyWith(color: Colors.grey, fontSize: 12),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  "\$" + product.price.toString(),
                  style: CustomTextStyle.textFormFieldBlack.copyWith(
                      color: Colors.greenAccent.shade700, fontSize: 14),
                ),
              ),
            ],
          ),
          Utils.getSizedBox(height: 16),
          RaisedButton(
            onPressed: () {
              setData(id, listSize[selectedSize].id);
              print("registro el producto");
            },
            color: Colors.green,
            padding: EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Text(
              "Add To Cart",
              style: CustomTextStyle.textFormFieldSemiBold
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
    );
  }

  GestureDetector createSizeItem(int index) {
    return GestureDetector(
      child: Container(
        width: 28,
        margin: EdgeInsets.all(4),
        height: 28,
        padding: EdgeInsets.only(top: 8),
        child: Text(
          listSize[index].size.toString(),
          style: CustomTextStyle.textFormFieldSemiBold
              .copyWith(fontSize: 12, color: Colors.black.withOpacity(0.8)),
          textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: selectedSize == index ? Colors.blue : Colors.grey,
                width: 1),
            shape: BoxShape.circle),
      ),
      onTap: () {
        setState(() {
          selectedSize = index;
        });
      },
    );
  }

  GestureDetector createColorItem(int index) {
    return GestureDetector(
      child: Container(
        width: 24,
        margin: EdgeInsets.all(4),
        height: 24,
        decoration: BoxDecoration(
            color: listColor[index],
            border: Border.all(
                color: Colors.grey, width: selectedColor == index ? 2 : 0),
            shape: BoxShape.circle),
      ),
      onTap: () {
        setState(() {
          selectedColor = index;
        });
      },
    );
  }

  Future<List<SizeShoe>> fetchPost(int id) async {
    final response = await http.get(Uri.parse(
        'http://localhost:8080/solicitud/lista_size/' + id.toString()));

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      //print(response.body);
      var data = json.decode(response.body);
      var rest = data['data'] as List;
      //qprint(rest);
      List<SizeShoe> list =
          rest.map((json) => SizeShoe.fromJson(json)).toList();
      //print('entro');
      return list;

      //return Post.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<http.Response> addCart(int id, int idSize) {
    return http.post(
      Uri.parse('http://localhost:8080/solicitud/addCart'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{
        'idProduct': id,
        'idSize': idSize,
        'idCart': 1,
      }),
    );
  }
}
