import 'package:flutter/material.dart';
import 'package:basic_flutter/services/json_service.dart';

class BackgroundTaskPage extends StatefulWidget{
  final String title;
  BackgroundTaskPage({this.title});

  @override
  BackgroundTaskState createState() => BackgroundTaskState();


}

class BackgroundTaskState extends State<BackgroundTaskPage>{
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadDataBackground().then((onValue){
      setState(() {
       widgets = onValue; 
      });
    });
  }

  showLoadingDialog(){
    if(widgets.length == 0){
      return true;
    }
    return false;
  }

  getBody(){
    if(showLoadingDialog()){
      return getProgressDialog();
    } else{
      return getListView();
    }
  }

  getProgressDialog(){
    return  Center(child: CircularProgressIndicator());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: getBody()
    );
  }

   ListView getListView() => ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int i) {
    return Padding(padding: EdgeInsets.all(10.0), child: Text("Row ${widgets[i]["title"]}"));
  }
}