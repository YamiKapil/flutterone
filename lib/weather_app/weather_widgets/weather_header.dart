import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_one/responsive_ui/size_config.dart';
import 'package:flutter_one/weather_app/weather_service/weather_model.dart';
import 'package:flutter_one/weather_app/weather_service/weather_service.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class WeatherHeader extends StatefulWidget {
  const WeatherHeader({Key? key}) : super(key: key);

  @override
  State<WeatherHeader> createState() => _WeatherHeaderState();
}

class _WeatherHeaderState extends State<WeatherHeader> {
  // final weatherData = WeatherServiceProvider();
  // WeatherModel? data;

  // Future getData() async {
  //   data = await weatherData.getData();
  // }
  @override
  void initState() {
    Provider.of<WeatherServiceProvider>(context, listen: false).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<WeatherServiceProvider>(context).getWetherData;
    return SafeArea(
      child: Stack(
        children: [
          Container(
            // color: Colors.blue,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: (data.temp > 0)
                    ? const NetworkImage(
                        'https://cdn.videoplasty.com/gif/sunny-icon-gif-stock-gif-3719-1280x720.gif',
                      )
                    : const NetworkImage(
                        'https://cdn.videoplasty.com/gif/snowflake-icon-gif-stock-gif-3717-1280x720.gif'),
                fit: BoxFit.cover,
              ),
            ),
            height: 20 * SizeConfig.heightMultiplier!,
            width: double.infinity,
            // child: (data.temp > 0)
            //     ? Align(
            //         alignment: Alignment.center,
            //         child: Icon(
            //           Icons.wb_sunny_outlined,
            //           size: 20 * SizeConfig.imageSizeMultiplier!,
            //         ),
            //       )
            //     : Align(
            //         alignment: Alignment.center,
            //         child: Icon(
            //           Icons.cloud_outlined,
            //           size: 20 * SizeConfig.imageSizeMultiplier!,
            //         ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Text(
              '${data!.cityName}',
              style: TextStyle(
                fontSize: 3 * SizeConfig.textMultiplier!,
                color: Colors.white,
              ),
            ),
          ),
          // Text('Humidity ${data!.humidity}'),
          // Text('Pressure ${data!.pressure}'),
          // Text('Wind ${data!.wind}'),
          // Text('Temp ${data!.temp}'),
          // Text('Feels Like ${data!.feelsLike}'),
          // Text(data.cityName),
        ],
      ),
    );
  }
}
