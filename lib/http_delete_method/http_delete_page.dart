import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'http_delete_service.dart';

class HttpDeletePage extends StatelessWidget {
  const HttpDeletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void delete(String title, String body) {
      Provider.of<HttpDeleteService>(context).deleteData(title, body);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Http Delete Method'),
      ),
      body: Container(
        child: Text('sdfsf'),
      ),
    );
  }
}
