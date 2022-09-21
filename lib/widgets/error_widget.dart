import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: divide(),
      ),
    );
  }

  divide() => 1 / 0;
}
