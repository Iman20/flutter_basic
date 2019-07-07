import 'package:basic_flutter/services/json_service.dart';
import 'package:flutter/material.dart';

class AsyncPage extends StatefulWidget{
  final String title;
  AsyncPage({this.title});

  @override
  AsyncState createState() => AsyncState();

}

class AsyncState extends State<AsyncPage>{
  List widgets = [];

  @override
  void initState() {
    super.initState();

    loadData().then((onValue){
      setState(() {
       widgets = onValue; 
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position){
          return getRow(position);
        },
      ),

    );
  }

  Widget getRow(int i){
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text("Row ${widgets[i]["title"]}"),
    );
  }
}