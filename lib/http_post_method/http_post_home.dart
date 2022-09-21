import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_one/responsive_ui/size_config.dart';
import 'package:http/http.dart' as http;
import 'http_post_model.dart';

class HttpPostHome extends StatefulWidget {
  const HttpPostHome({Key? key}) : super(key: key);

  @override
  State<HttpPostHome> createState() => _HttpPostHomeState();
}

Future submitData(String name, String job) async {
  var response = await http.post(Uri.https('reqres.in', 'api/users'), body: {
    'name': name,
    'job': job,
  });
  var data = response.body;
  log(data, name: 'data');
  if (response.statusCode == 201) {
    String responseString = response.body;
    dataModelFromJson(responseString);
  }
  return null;
}

class _HttpPostHomeState extends State<HttpPostHome> {
  var _dataModel = DataModel();
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http Post Method from Reqres'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 6.5 * SizeConfig.widthMultiplier!,
          vertical: 2.5 * SizeConfig.heightMultiplier!,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter name here',
                  labelText: 'Name',
                ),
                controller: nameController,
              ),
              SizedBox(height: 1.2 * SizeConfig.heightMultiplier!),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter job title here',
                  labelText: 'Job Title',
                ),
                controller: jobController,
              ),
              SizedBox(height: 1.2 * SizeConfig.heightMultiplier!),
              ElevatedButton(
                onPressed: () async {
                  String name = nameController.text;
                  String job = jobController.text;
                  DataModel data = await submitData(name, job);
                  setState(() {
                    _dataModel = data;
                  });
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
