import 'package:basic_flutter/animate_page.dart';
import 'package:basic_flutter/counting_page.dart';
import 'package:basic_flutter/drawing_page.dart';
import 'package:basic_flutter/toggle_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  final String title;
  HomePage({this.title});

  @override
  HomeState createState() => HomeState();

}

class HomeState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black12,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 16.0),),
          RaisedButton(
            child: Text('Counter Page'),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CounterPage(title: widget.title,)));
            },
          ),
          Padding(padding: EdgeInsets.only(top: 16.0,)),
          RaisedButton(
            child: Text('Toggle Page'),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TogglePage(title: widget.title,)));
            },
          ),
          Padding(padding: EdgeInsets.only(top: 16.0,)),
          RaisedButton(
            child: Text('Animation Page'),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimatePage(title: widget.title,)));
            },
          ),
          Padding(padding: EdgeInsets.only(top: 16.0,)),
          RaisedButton(
            child: Text('Drawing Page'),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DrawingPage(title: widget.title,)));
            },
          ),
        ],),
      )
    );
  }
}