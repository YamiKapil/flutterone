import 'package:flutter/material.dart';
import 'package:flutter_one/responsive_ui/size_config.dart';
import 'package:provider/provider.dart';

import '../weather_service/weather_service.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<WeatherServiceProvider>(context).getWetherData;
    return SafeArea(
      child: Wrap(
        children: [
          SizedBox(
            height: 10 * SizeConfig.heightMultiplier!,
            width: 25 * SizeConfig.widthMultiplier!,
            child: Card(
              child: Column(
                children: [
                  Text('Humidity'),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier!),
                  Text(data.humidity.toString()),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10 * SizeConfig.heightMultiplier!,
            width: 25 * SizeConfig.widthMultiplier!,
            child: Card(
              child: Column(
                children: [
                  Text('Temp'),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier!),
                  Text(data.temp.toString()),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10 * SizeConfig.heightMultiplier!,
            width: 25 * SizeConfig.widthMultiplier!,
            child: Card(
              child: Column(
                children: [
                  Text('Wind'),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier!),
                  Text(data.wind.toString()),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10 * SizeConfig.heightMultiplier!,
            width: 25 * SizeConfig.widthMultiplier!,
            child: Card(
              child: Column(
                children: [
                  Text('Feels Like'),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier!),
                  Text(data.feelsLike.toString()),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10 * SizeConfig.heightMultiplier!,
            width: 25 * SizeConfig.widthMultiplier!,
            child: Card(
              child: Column(
                children: [
                  Text('Pressure'),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier!),
                  Text(data.pressure.toString()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
