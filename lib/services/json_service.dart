import 'dart:convert';
import 'package:http/http.dart' as http;

final String url = 'https://jsonplaceholder.typicode.com/posts';

Future<List> loadData() async{
  String dataURL = url;
  http.Response response = await http.get(dataURL);
  return json.decode(response.body);
}