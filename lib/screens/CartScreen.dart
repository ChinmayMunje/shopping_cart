import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart_application/data/CrMethod.dart';
import 'package:shopping_cart_application/screens/UserModel.dart';

class CartScreen extends StatefulWidget {

  final List<UserModel> _cartList;

  CartScreen(this._cartList);

  @override
  _CartScreenState createState() => _CartScreenState(this._cartList);
}

class _CartScreenState extends State<CartScreen> {
  crudMethod crudObj = new crudMethod();


  _CartScreenState(this._cartList);
  List<UserModel> _cartList;

  @override
  void initState() {
    crudObj.getData().then((result){
      print("my result is : "+result);
      setState(() {
        _cartList=result;
      });
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Cart List",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.refresh),
              onPressed: (){
                crudObj.getData().then((result){
                  setState(() {
                    _cartList=result;
                  });
                });
              }
          ),
        ],
      ),
      body:ListView.builder(
          itemCount: _cartList.length,
          itemBuilder: (context, index) {
            UserModel userModel = _cartList[index];
            return Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Card(
                elevation: 4.0,
                child: ListTile(
                  title: Text(userModel.productElements.title.title,style: TextStyle(fontSize: 15),),
                  subtitle: Text(userModel.productElements.price.sellPrice.formatedAmount),
                ),
              ),
            );
          })


    );
  }
}



