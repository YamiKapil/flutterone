import 'package:flutter/material.dart';
import 'package:flutter_one/responsive_ui/size_config.dart';
import 'package:flutter_one/weather_app/weather_widgets/weather_body.dart';
import '../weather_widgets/weather_header.dart';

class WeatherHome extends StatelessWidget {
  const WeatherHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.keyboard_arrow_left),
                ),
                // const SizedBox(width: 20),
                const Expanded(
                  child: Center(
                    child: Text('Weather App'),
                  ),
                ),
              ],
            ),
            const WeatherHeader(),
            SizedBox(height: 2.5 * SizeConfig.heightMultiplier!),
            const WeatherBody(),
          ],
        ),
      ),
    );
  }
}
