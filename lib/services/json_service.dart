import 'dart:convert';
import 'dart:isolate';
import 'package:http/http.dart' as http;

final String url = 'https://jsonplaceholder.typicode.com/posts';

Future<List> loadData() async{
  String dataURL = url;
  http.Response response = await http.get(dataURL);
  return json.decode(response.body);
}

Future<List> loadDataBackground() async {
  ReceivePort receivePort = ReceivePort();
  await Isolate.spawn(dataLoader, receivePort.sendPort);

  SendPort sendPort = await receivePort.first;

  return await sendReceive(sendPort, url);
}

dataLoader(SendPort sendPort) async{
  ReceivePort port = ReceivePort();
  sendPort.send(port.sendPort);

  await for(var msg in port){
    String data = msg[0];
    SendPort replyTo = msg[1];

    String dataURL = data;
    http.Response response = await http.get(dataURL);
    replyTo.send(json.decode(response.body));
  }
}

Future sendReceive(SendPort port, msg){
  ReceivePort response = ReceivePort();
  port.send([msg, response.sendPort]);
  return response.first;
}