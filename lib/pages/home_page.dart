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
              Navigator.of(context).pushNamed('/count');
            },
          ),
          Padding(padding: EdgeInsets.only(top: 16.0,)),
          RaisedButton(
            child: Text('Toggle Page'),
            onPressed: (){
              Navigator.of(context).pushNamed('/toggl');
            },
          ),
          Padding(padding: EdgeInsets.only(top: 16.0,)),
          RaisedButton(
            child: Text('Animation Page'),
            onPressed: (){
              Navigator.of(context).pushNamed('/anima');
            },
          ),
          Padding(padding: EdgeInsets.only(top: 16.0,)),
          RaisedButton(
            child: Text('Drawing Page'),
            onPressed: (){
              Navigator.of(context).pushNamed('/drawi');
            },
          ),
          Padding(padding: EdgeInsets.only(top: 16.0,)),
          RaisedButton(
            child: Text('Async Task Page'),
            onPressed: (){
              Navigator.of(context).pushNamed('/asin');
            },
          ),
          Padding(padding: EdgeInsets.only(top: 16.0,)),
          RaisedButton(
            child: Text('Background Task Page'),
            onPressed: (){
              Navigator.of(context).pushNamed('/back');
            },
          ),
          Padding(padding: EdgeInsets.only(top: 16.0,)),
          RaisedButton(
            child: Text('Database Page'),
            onPressed: (){
              Navigator.of(context).pushNamed('/database');
            },
          ),
        ],),
      )
    );
  }
}