import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Product.dart';

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState(){
    super.initState();
    controller = AnimationController(vsync: this,duration: const Duration(seconds: 10));
    animation = Tween<double>(begin: 0.0,end:1.0).animate(controller);
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    controller.forward();
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: "Product layout demo home page",animation: animation)
    );
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
}

class ProductBox extends StatelessWidget{
  final String name;
  final String description;
  final int price;
  final String image;

  ProductBox({super.key,required this.name,required this.description,required this.price,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/"+this.image),
            Expanded(child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(this.name,style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(this.description),
                  Text("Price "+this.price.toString())
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class MyAnimationWidget extends StatelessWidget{
  final Widget child;
  final Animation<double> animation;
  MyAnimationWidget({super.key,required this.child,required this.animation});

  @override
  Widget build(BuildContext context) => Center(
      child: AnimatedBuilder(
          animation: animation,
          builder: (context,child) => Container(
              child: Opacity(opacity: animation.value,child: child)
          ),
          child: child
      )
  );
}

class MyHomePage extends StatelessWidget{
  final String title;
  final Animation<double> animation;

  MyHomePage({super.key,required this.title,required this.animation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Listing"),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
        children: <Widget>[
          FadeTransition(
            opacity: animation,
            child: ProductBox(name: "Baki", description: "Hey Baki", price: 100, image: "baki.jpg"),
          ),
          MyAnimationWidget(child: ProductBox(name: "Babi", description: "Hello Babi", price: 200, image: "babi.jpg"), animation: animation),
          ProductBox(name: "Dabi", description: "Hi Hi Dabi", price: 300, image: "dabi.jpg"),
          ProductBox(name: "Dabi", description: "Hi Hi Dabi", price: 300, image: "dabi.jpg"),
          ProductBox(name: "Dabi", description: "Hi Hi Dabi", price: 300, image: "dabi.jpg"),
          ProductBox(name: "Dabi", description: "Hi Hi Dabi", price: 300, image: "dabi.jpg"),
        ],
      ),
    );
  }

}