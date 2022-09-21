import 'dart:convert';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class IsolateExample extends StatefulWidget {
  const IsolateExample({Key? key}) : super(key: key);

  @override
  State<IsolateExample> createState() => _IsolateExampleState();
}

class _IsolateExampleState extends State<IsolateExample> {
  @override
  void initState() {
    super.initState();
    createIsolate();
    createComputeFunction();
  }

  // compute
  Future<void> createComputeFunction() async {
    String result =
        await compute(computeFunction, 'https://randomuser.me/api/');
    print(result);
  }

  //compute
  static Future<String> computeFunction(String url) async {
    var response = await http.get(Uri.parse(url));
    return jsonDecode(response.body)['results'][0]['email'];
  }

  //isolate..
  Future createIsolate() async {
    ReceivePort receivePort = ReceivePort();
    Isolate.spawn(isolateFunction, receivePort.sendPort);
    SendPort childSendPort = await receivePort.first;

    ReceivePort responsePort = ReceivePort();
    childSendPort.send(['https://randomuser.me/api/', responsePort.sendPort]);

    var response = await responsePort.first;
    print(response['results'][0]['email']);
  }

  //isolate
  static void isolateFunction(SendPort mainSendPort) async {
    ReceivePort childReceivePort = ReceivePort();
    mainSendPort.send(childReceivePort.sendPort);

    await for (var message in childReceivePort) {
      String url = message[0];
      SendPort replyPort = message[1];

      var response = await http.get(Uri.parse(url));
      replyPort.send(jsonDecode(response.body));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Isolate and Compute Example'),
        ),
        body: SizedBox(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Hello there '),
              ],
            ),
          ),
        ));
  }
}
