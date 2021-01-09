import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart_application/data/CrMethod.dart';
import 'package:shopping_cart_application/data/ProductModel.dart';
import 'package:shopping_cart_application/screens/CartScreen.dart';
import 'package:shopping_cart_application/screens/UserModel.dart';
import 'package:shopping_cart_application/widgets/Product_carousel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  String productTitle;
  String productPrice;

  crudMethod crudObj = new crudMethod();

  TextEditingController searchController = TextEditingController();


  // List<ProductModel> products;

  // String url = "https://jsonplaceholder.typicode.com/users";
  String url = "https://ali-express1.p.rapidapi.com/search?query=Xiaomi&from=0&country=CO&limit=30";


  Future <List<UserModel>> getUsers() async {
    try{
       final response = await http.get(url,  headers: {
         "x-rapidapi-key":"", "x-rapidapi-host":"ali-express1.p.rapidapi.com"
       });

       if(response.statusCode == 200){
         final List<UserModel> users = userModelFromJson(response.body);
         return users;
       }
       else {
         return List<UserModel>();
       }
    }catch(e){
      return List<UserModel>();
    }

  }

  List<UserModel> _userModel = List<UserModel>();
  List<UserModel> _cartList = List<UserModel>();
  @override
  void initState() {
    // TODO: implement initState
    getUsers().then((users){
      setState(() {
        _userModel = users;
      });
      crudObj.getData().then((users){
        setState(() {
          _cartList=users;
        });
      });
    });
    // getProducts().then((products){
    //   products = products;
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: (){},
            child: Icon(Icons.sort,color: Colors.white),
        ),
        title: Text("Products", style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w600),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:10),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(_cartList)));
              },
                child: Icon(Icons.add_shopping_cart, color: Colors.white),
            ),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: _userModel.length,
        itemBuilder: (context, index){
          UserModel userModel = _userModel[index];
          return Container(
            height: 130,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  ListTile(
                    title: Text(userModel.productElements.title.title,style: TextStyle(fontSize: 15),),
                    subtitle: Text(userModel.productElements.price.sellPrice.formatedAmount),
                  ),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                      child: OutlineButton(
                        onPressed: (){
                            if(!_cartList.contains(userModel))
                              _cartList.add(userModel);
                          crudObj.addData({
                              'productName': userModel.productElements.title.title,
                              'productPrice': userModel.productElements.price.sellPrice.formatedAmount,
                            }).then((users){
                              // dialogTrigger(context);
                              final snackBar = SnackBar(content: Text('Product added to Cart'));
                              Scaffold.of(context).showSnackBar(snackBar);
                            }).catchError((e){
                              print(e);
                            });
                            // if (!_cartList.contains(userModel))
                            //   _cartList.add(userModel);
                            // else
                            //   _cartList.remove(userModel);
                        },
                        child: Text("Add to Cart", style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}










