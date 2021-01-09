import 'package:flutter/material.dart';
import 'package:shopping_cart_application/data/SliderModel.dart';
import 'package:shopping_cart_application/screens/Login.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = getSlides();
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                onPageChanged: (value){
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: slides.length,
                itemBuilder: (context, index){
                  return Slider(
                    image: slides[index].getImage(),
                    title: slides[index].getTitle(),
                    description: slides[index].getDescription(),
                  );
                }
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(slides.length, (index) => buildDot(index, context),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.red,
            ),
            child: FlatButton(
              child: Text(
                  currentIndex == slides.length - 1 ? "Continue": "Next"),
              onPressed: (){
                if(currentIndex == slides.length - 1){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login()),
                  );
                }
                _controller.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);

              },
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),

          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
  Container buildDot(int index, BuildContext context){
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red,
      ),
    );
  }
}
// ignore: must_be_immutable
class Slider extends StatelessWidget {
  String image,title,description;

  Slider({this.image, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(image)),
          SizedBox(height: 20),
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          SizedBox(height: 12),
          Text(description),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
