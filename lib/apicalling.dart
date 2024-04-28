import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/modelclass.dart';

class apiCalling {
  WeatherModel? obj;

  Future loadApiData(city) async {
    final http.Response response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=3d8fece176f54fecbf685227241104&q=${city}&days=7&aqi=no&alerts=no'));
    var d = jsonDecode(response.body);

    // var data = await rootBundle.loadString('assets/waether.json');
    //
    // var d = jsonDecode(data);


    obj = WeatherModel.fromJson(d);

    return obj;
  }
}
