import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ProductCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Top Selling",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600, color: Colors.black),),
              OutlineButton(
                onPressed: (){

                },
                child: Text("See all", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, backgroundColor: Colors.white70),
                ),
              ),
            ],
          ),
        ),

        Container(
          height: 275,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              // itemCount: product.length,
              itemBuilder: (context,index){
              return ProductCard(

              );

              }
          ),
        ),


      ],
    );
  }
}


class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  ProductCard({this.imageUrl,this.name,this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
          ),
        ],
      ),
    );
  }
}
