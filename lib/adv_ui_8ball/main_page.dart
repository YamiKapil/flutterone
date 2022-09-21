import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_one/adv_ui_8ball/components/magic_8_ball.dart';
import 'package:flutter_one/adv_ui_8ball/components/sphere_of_destiny.dart';
import 'package:flutter_one/main.dart';

import 'components/rules_of_oracle.dart';

class AdvPageMain extends StatefulWidget {
  const AdvPageMain({Key? key}) : super(key: key);

  @override
  State<AdvPageMain> createState() => _AdvPageMainState();
}

class _AdvPageMainState extends State<AdvPageMain> {
  @override
  void initState() {
    super.initState();
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     flutterLocalNotificationsPlugin.show(
    //       notification.hashCode,
    //       notification.title,
    //       notification.body,
    //       NotificationDetails(
    //         android: AndroidNotificationDetails(
    //           channel.id,
    //           channel.name,
    //           channelDescription: channel.description,
    //           playSound: true,
    //           icon: '@mipmap/ic_launcher',
    //         ),
    //       ),
    //     );
    //   }
    // });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('new onmessageopened event');
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     showDialog(
    //         context: context,
    //         builder: (_) {
    //           return AlertDialog(
    //             title: Text(notification.title.toString()),
    //             content: SingleChildScrollView(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(notification.body.toString()),
    //                 ],
    //               ),
    //             ),
    //           );
    //         });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The MAGIC 8-Ball'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: const [
            // SphereOfDestiny(diameter: 200),
            Magic8Ball(),
            Expanded(
              child: RulesOfTheOracle(),
            )
          ],
        ),
      ),
    );
  }
}
