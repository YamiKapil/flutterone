import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

class TelephonySmsReader extends StatefulWidget {
  const TelephonySmsReader({Key? key}) : super(key: key);

  @override
  State<TelephonySmsReader> createState() => _TelephonySmsReaderState();
}

final Telephony telephony = Telephony.instance;
TextEditingController? _listningSms;
List<SmsMessage>? messagess;

class _TelephonySmsReaderState extends State<TelephonySmsReader> {
  @override
  void initState() {
    telephony.listenIncomingSms(
        onNewMessage: (SmsMessage message) {
          _listningSms?.text = message.body.toString();
          setState(() {});
          log(message.body.toString(),name: 'listining body');
        },
        listenInBackground: false);
    getInboxMessages();
    super.initState();
  }

  getInboxMessages() async {
    List<SmsMessage> messages = await telephony.getInboxSms(
      columns: [SmsColumn.ADDRESS, SmsColumn.BODY],
      // filter: SmsFilter.where(SmsColumn.ADDRESS)
      // 		 .equals("1234567890")
      // 		 .and(SmsColumn.BODY)
      // 		 .like("starwars"),
      sortOrder: [
        OrderBy(SmsColumn.DATE, sort: Sort.ASC),
        OrderBy(SmsColumn.BODY)
      ],
    );
    log(messages[0].body.toString(),name: 'sms messages');
    log(messages.length.toString(), name: 'sms messages length');
    setState(() {
    messagess = messages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Telephony Sms Reader'),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Text('Retriving Sms from the device'),
                Text(messagess?[1].body.toString() ?? ''),
                SizedBox(
                  height: 20,
                ),
                Text('Listning to the Sms'),
                Text(_listningSms?.text.toString() ?? 'empty'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
