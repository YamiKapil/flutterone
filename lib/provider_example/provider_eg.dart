import 'package:flutter/material.dart';
import 'package:flutter_one/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'provider_class.dart';

class ProviderExample extends StatelessWidget {
  const ProviderExample({Key? key}) : super(key: key);

  // var _counter = 0;
  void _incrementCount(BuildContext context) {
    Provider.of<Counter>(context, listen: false).incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    var _counter = Provider.of<Counter>(context).getCounter;
    final themeNotifier = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch.adaptive(
              value: themeNotifier.DarkTheme,
              onChanged: (value){
                themeNotifier.setTheme();
              },
            ),
            SizedBox(height: 20),
            const Text('You have clicked the button this many times'),
            Text(_counter.toString()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCount(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
