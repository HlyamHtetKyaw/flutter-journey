import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(title: "Flutter Demo Home Page"),
    );
  }
}

class MyHomePage extends StatelessWidget{
  final String title;
  static const platform = const MethodChannel('flutterapp.tutorialspoint.com/browser');
  MyHomePage({super.key,required this.title});

  Future<void> _openBrowser() async{
    try{
      final bool result = await platform.invokeMethod(
        'openBrowser',<String,String>{
          'url':"https://flutter.dev"
      }
      );
    }on PlatformException catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: ElevatedButton(onPressed: _openBrowser,child: Text('Open Browser'),),
      ),
    );
  }
}

void main(){
  runApp(MyApp());
}