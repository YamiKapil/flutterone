import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_one/weather_app/weather_service/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherServiceProvider with ChangeNotifier {
  get getWetherData => weatherModel;

  WeatherModel? weatherModel;

  Future getData() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Kathmandu&appid=eb42031611601a1401c1e7423f7ce112&units=metric');
    var request = await http.get(url);
    // log(request.body, name: 'body');
    var response = json.decode(request.body);
    print(json.decode(request.body));
    // WeatherModel weatherModel = WeatherModel.fromJson(response);
    // or...
    weatherModel = WeatherModel.fromJson(response);
    notifyListeners();
    // return weatherModel;
  }
}
