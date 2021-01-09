import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_cart_application/screens/Dashboard.dart';
import 'package:shopping_cart_application/screens/Login.dart';
import 'package:shopping_cart_application/screens/OnBoardingScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    Future<bool> val = getVisitFirst();
    // TODO: implement initState

    if(val != null){
      Timer(Duration(seconds: 3), () =>
          Navigator.push(context, MaterialPageRoute(builder: (context)=> OnBoardingScreen())),
      );
    }else{
      Timer(Duration(seconds: 3), () =>
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard())),);
          }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/splash1.jpg"),
              fit: BoxFit.cover,
            ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('images/logo.jpg')),
                      SizedBox(
                        height: 20,
                      ),
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.brown[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<bool> getVisitFirst() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool visited = preferences.getBool("already visited") ?? false;
  return visited;
}
