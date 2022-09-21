import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import 'http_delete_model.dart';

class HttpDeleteService with ChangeNotifier {
  Future deleteData(String title, String body) async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    var response = await http.delete(url, body: {
      title: title,
      body: body,
    });
    log(response.body, name: 'delete log');
    // if (response.statusCode == 201) {
    String responseString = response.body;
    httpDeleteModelFromJson(responseString);
    // }
    notifyListeners();
  }
}
