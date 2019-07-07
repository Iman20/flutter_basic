import 'package:basic_flutter/pages/animate_page.dart';
import 'package:basic_flutter/pages/async_page.dart';
import 'package:basic_flutter/pages/counting_page.dart';
import 'package:basic_flutter/pages/drawing_page.dart';
import 'package:basic_flutter/pages/home_page.dart';
import 'package:basic_flutter/pages/toggle_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final routes = <String, WidgetBuilder>{
  '/count' : (BuildContext context) => CounterPage(title: 'Counter Page',),
  '/toggl' : (BuildContext context) => TogglePage(title: 'Toggle Page',),
  '/anima' : (BuildContext context) => AnimatePage(title: 'Animate Page',),
  '/drawi' : (BuildContext context) => DrawingPage(title: 'Drawing Page',),
  '/asin' : (BuildContext context) => AsyncPage(title: 'Async Page',),
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(title: 'Flutter Demo Home Page'),
      routes: routes
    );
  }
}

