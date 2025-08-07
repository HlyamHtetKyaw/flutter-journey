import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget{
  MyHomePage({Key? key,required this.title}):super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Listing")),
      body: ListView(
        shrinkWrap: true, padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
        children: <Widget>[
          ProductBox(name: "baki", description: "baki is hamma", price: 1000, image: "baki.jpg"),
          ProductBox(name: "Baki", description: "This is also baki", price: 2000, image: "baki.jpg"),
          ProductBox(name: "bAki", description: "Pricey Baki", price: 4000, image: "baki.jpg"),
          ProductBox(name: "baKi", description: "Hello baki", price: 700, image: "baki.jpg"),
          ProductBox(name: "bakI", description: "Hi Hi baki", price: 500, image: "baki.jpg"),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: "Baki Listing"),
    );
  }
}

class MyButton extends StatelessWidget{
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
        top:BorderSide(width: 1.0,color: Color(0xFFFFFFFFFF)),
        left:BorderSide(width: 1.0,color: Color(0xFFFFFFFFFF)),
        right:BorderSide(width: 1.0,color: Color(0xFFFFFFFFFF)),
        bottom:BorderSide(width: 1.0,color: Color(0xFFFFFFFFFF)),
        ),
      ),
      child: Container(
        padding: const
        EdgeInsets.symmetric(horizontal: 20.0,vertical: 2.0),
        decoration: const BoxDecoration(
          border: Border(
            top:BorderSide(width: 1.0,color: Color(0xFFFFDFDFDF)),
            left:BorderSide(width: 1.0,color: Color(0xFFFFDFDFDF)),
            right:BorderSide(width: 1.0,color: Color(0xFFFFDFDFDF)),
            bottom:BorderSide(width: 1.0,color: Color(0xFFFFDFDFDF)),
          ),
          color: Colors.grey
        ),
        child: const Text(
          'OK',textAlign: TextAlign.center, style: TextStyle(color:Colors.black),
        ),
      ),
    );
  }
}

class ProductBox extends StatelessWidget{
  final String name;
  final String description;
  final int price;
  final String image;

  const ProductBox({super.key,required this.name,required this.description,required this.price,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),height: 120, child: Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset("assets/"+image,width: 100,height: 100,fit: BoxFit.fill,),
          Expanded(child: Container(
            padding: EdgeInsets.all(5),child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(this.name,style: TextStyle(fontWeight: FontWeight.bold)),
              Text(this.description),
              Text("Price: "+this.price.toString()),
            ],
          ),
          ))
        ],
      ),
    ),
    );
    throw UnimplementedError();
  }

}
void main(){
  runApp(const MyApp());
}