import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Product.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: MyHomePage(title: "Testing stage management"),
    );
  }
}

class MyHomePage extends StatelessWidget{
  final String title;
  final items = Product.getProducts();
  MyHomePage({super.key,required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index){
            return GestureDetector(
              child: ProductBox(item: items[index]),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage(item:items[index])));
              },
            );
          }),
    );
  }
}

class ProductPage extends StatelessWidget{
  final Product item;
  ProductPage({super.key,required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.item.name)),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset("assets/"+this.item.image),
              Expanded(child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(this.item.name,style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(this.item.description),
                    Text("Price: "+this.item.price.toString()),
                    RatingBox()
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
class RatingBox extends StatefulWidget{
  @override
  _RatiingBoxState createState() => _RatiingBoxState();
}

class _RatiingBoxState extends State<RatingBox>{
  int _rating = 0;
  void _setRatingAsOne(){
    setState(() {
      _rating = 1;
    });
  }
  void _setRatingAsTwo(){
    setState(() {
      _rating = 2;
    });
  }
  void _setRatingAsThree(){
    setState(() {
      _rating = 3;
    });
  }
  @override
  Widget build(BuildContext context) {
    double _size = 20;
    print(_rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(0),
            child: IconButton(
              onPressed: _setRatingAsOne,
              icon: (_rating>=1)?Icon(Icons.star,size:_size):Icon(Icons.star_border,size:_size),
              color: Colors.red,
              iconSize: _size,)
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            onPressed: _setRatingAsTwo,
            icon: (_rating>=2)?Icon(Icons.star,size: _size):Icon(Icons.star_border,size:_size),
            color: Colors.red[500],
            iconSize: _size,),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            onPressed: _setRatingAsThree,
            icon: (_rating>=3)?Icon(Icons.star,size:_size):Icon(Icons.star_border,size:_size),
            iconSize: _size,),
        )
      ],
    );
    throw UnimplementedError();
  }
}

class ProductBox extends StatelessWidget{
  final Product item;
  ProductBox({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/"+this.item.image),
            Expanded(child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(this.item.name,style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(this.item.description),
                  Text("Price: "+this.item.price.toString()),
                  RatingBox()
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}