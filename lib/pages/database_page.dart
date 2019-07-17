import 'package:basic_flutter/database/databasehelper.dart';
import 'package:flutter/material.dart';


class DatabaseTask extends StatelessWidget{
  final String title;
  final dbHelper = DatabaseHelper.instance;

  DatabaseTask({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text('Insert', style: TextStyle(fontSize: 20),),
                onPressed: () {
                  _insert();
                },
            ),
            RaisedButton(
                child: Text('Update', style: TextStyle(fontSize: 20),),
                onPressed: () {
                  _update();
                },
            ),
            RaisedButton(
                child: Text('Query', style: TextStyle(fontSize: 20),),
                onPressed: () {
                  _query();
                },
            ),
            RaisedButton(
                child: Text('Delete', style: TextStyle(fontSize: 20),),
                onPressed: () {
                  _delete();
                },
            ),
          ],
        ),
      ),

    );
  }

  void _insert() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : 'Bob',
      DatabaseHelper.columnAge : 23
    };
    final id = await dbHelper.insert(row);
    print('insert row id : $id');
  }

  void _update() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId : 1,
      DatabaseHelper.columnName : 'Mary',
      DatabaseHelper.columnAge : 32
    };
    final rowAffected = await dbHelper.update(row);
    print('update $rowAffected row(s)');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows: ');
    allRows.forEach((row)=>print(row));
  }

  void _delete() async {
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('delete $rowsDeleted row(s) : row $id');
  }



}

