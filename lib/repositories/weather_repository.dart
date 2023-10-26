import 'dart:convert';

import 'package:final_620710661/models/weather.dart';

import '../services/api_caller.dart';

class WeatherRepository {
  Future<List<Weather>> getWeather() async {
    try {
      var result = await ApiCaller().get('weather?_embed=condition');
      List list = jsonDecode(result);
      List<Weather> weatherList =
      list.map<Weather>((item) => Weather.fromJson(item)).toList();
      return weatherList;
    } catch (e) {
      // TODO:
      rethrow;
    }
  }

}
