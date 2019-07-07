import 'package:flutter/material.dart';

class TogglePage extends StatefulWidget{
  final String title;
  TogglePage({this.title});

  @override
  ToggleState createState() => ToggleState();

}

class ToggleState extends State<TogglePage>{
  bool toggle = true;
  void _toggle(){
    setState(() {
     toggle = !toggle; 
    });
  }

  _getToggleChild(){
    if(toggle){
      return Text('Toggle One');
    } else {
      return MaterialButton(onPressed: (){}, child: Text('Toggle Two'),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),

    );
  }
}