import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';

class AppUpdate extends StatefulWidget {
  const AppUpdate({Key? key}) : super(key: key);

  @override
  _AppUpdateState createState() => _AppUpdateState();
}

class _AppUpdateState extends State<AppUpdate> {
  AppUpdateInfo? _updateInfo;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  bool _flexibleUpdateAvailable = false;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });
      log(_updateInfo?.updatePriority.toString() ?? '',
          name: 'update prrority');
      log(_updateInfo?.availableVersionCode.toString() ?? '',
          name: 'code version');
      log(_updateInfo?.flexibleUpdateAllowed.toString() ?? '',
          name: 'flex update');
      log(_updateInfo?.installStatus.toString() ?? '',
          name: 'insatll Status prrority');
      log(_updateInfo?.immediateUpdateAllowed.toString() ?? '',
          name: 'immediate');
      log(_updateInfo?.packageName.toString() ?? '', name: 'package name');
    }).catchError((e) {
      showSnack(e.toString());
    });
  }

  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }

  @override
  Widget build(BuildContext context) {
    // log(_updateInfo!.updatePriority.toString(), name: 'update prrority');
    // log(_updateInfo!.availableVersionCode.toString(), name: 'code version');
    // log(_updateInfo!.flexibleUpdateAllowed.toString(), name: 'flex update');
    // log(_updateInfo!.installStatus.toString(), name: 'insatll Status prrority');
    // log(_updateInfo!.immediateUpdateAllowed.toString(), name: 'immediate');
    // log(_updateInfo!.packageName.toString(), name: 'package name');
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('In App Update Example App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text('Update info: $_updateInfo'),
              ),
              ElevatedButton(
                child: Text('Check for Update'),
                onPressed: () {
                  checkForUpdate();
                },
              ),
              ElevatedButton(
                child: Text('Perform immediate update'),
                onPressed: _updateInfo?.updateAvailability ==
                        UpdateAvailability.updateAvailable
                    ? () {
                        InAppUpdate.performImmediateUpdate()
                            .catchError((e) => showSnack(e.toString()));
                      }
                    : null,
              ),
              ElevatedButton(
                child: Text('Start flexible update'),
                onPressed: _updateInfo?.updateAvailability ==
                        UpdateAvailability.updateAvailable
                    ? () {
                        InAppUpdate.startFlexibleUpdate().then((_) {
                          setState(() {
                            _flexibleUpdateAvailable = true;
                          });
                        }).catchError((e) {
                          showSnack(e.toString());
                        });
                      }
                    : null,
              ),
              ElevatedButton(
                child: Text('Complete flexible update'),
                onPressed: !_flexibleUpdateAvailable
                    ? null
                    : () {
                        InAppUpdate.completeFlexibleUpdate().then((_) {
                          showSnack("Success!");
                        }).catchError((e) {
                          showSnack(e.toString());
                        });
                      },
              )
            ],
          ),
        ),
      ),
    );
  }
}
