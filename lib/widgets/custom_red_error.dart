import 'package:flutter/material.dart';
import 'package:flutter_one/responsive_ui/size_config.dart';
import 'package:flutter/foundation.dart' as foundation;

Widget errorScreen(dynamic detailsException) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Error'),
    ),
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 2 * SizeConfig.heightMultiplier!,
          horizontal: 6 * SizeConfig.widthMultiplier!,
        ),
        child: foundation.kReleaseMode
            ? const Center(
                child: Text('Sorry for any inconvinence'),
              )
            : SingleChildScrollView(
                child: Text('Exeption Details:\n\n$detailsException'),
              ),
      ),
    ),
  );
}
