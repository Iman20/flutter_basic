import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget{
  final String title;
  CounterPage({this.title});
  @override
  CounterState createState() => CounterState();
  
}

class CounterState extends State<CounterPage>{
  int _counter = 0;

  void _increament(){
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('$_counter',
          style: Theme.of(context).textTheme.display1,)
        ],) 
        ,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increament,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      );
  }

}