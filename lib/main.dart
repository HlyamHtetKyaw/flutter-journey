import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget{
  MyHomePage({Key? key,required this.title}):super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:Text(this.title),),
    body: Center(child:Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.all(25),
      child: Center(
        child: Text(
          'Hello World',
          style: TextStyle(
            color: Colors.black,letterSpacing: 0.5,fontSize: 20,
          ),
          textDirection: TextDirection.ltr,
        ),
      ),
    )),
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
      home: MyHomePage(title: 'Home Page'),
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
void main(){
  runApp(const MyApp());
}