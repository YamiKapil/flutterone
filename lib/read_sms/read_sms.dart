import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:sms/sms.dart';

class ReadSms extends StatefulWidget {
  const ReadSms({Key? key}) : super(key: key);

  @override
  State<ReadSms> createState() => _ReadSmsState();
}

class _ReadSmsState extends State<ReadSms> {
   List? _allMessages;
  @override
  void initState() {
    super.initState();

    // getAllMessages();
  }

  // Future getAllMessages() async {
  //   SmsQuery query = new SmsQuery();
  //   List<SmsMessage> messages = await query.getAllSms;
  //   debugPrint("Total Messages : " + messages.length.toString());
  //   log(messages[1].body.toString());
  //   _allMessages?.add(messages.map((e) => e.body));
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Container(),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    log(_allMessages?.map((e) => e).toString()??'null',name: 'data');
    debugPrint(_allMessages?.map((e) => e).toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Text("Test");
        },
      ),
    );
  }
}
