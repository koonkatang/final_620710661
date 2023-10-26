import 'package:flutter/material.dart';
import 'package:final_620710661/models/weather.dart';

class WeatherListItem extends StatelessWidget {
  static const iconSize = 18.0;

  final Weather weather;

  const WeatherListItem({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;

    var city = weather.city;
    var country = weather.country;
    var lastUpdated = weather.lastUpdated;
    double temp = 0;
    var tempC = weather.tempC;
    var tempF = weather.tempF;
    var feelsLikeC = weather.feelsLikeC;
    var feelsLikeF = weather.feelsLikeF;
    var windKph = weather.windKph;
    var windMph = weather.windMph;
    var humidity = weather.humidity;
    var uv = weather.uv;


    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(city,style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(country,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(lastUpdated,style: TextStyle(fontSize: 20),),
          ),Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(,style: TextStyle(fontSize: 60),),
          ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 children: [
                   Text('Feels Like ' ,style: TextStyle(fontSize: 40),),
                    Text(feelsLikeC as String ,style: TextStyle(fontSize: 40),),
                 ],
               ),
             ),
          Row(
            children: [
              TextButton(onPressed: onPressed, child: Text('C')),
              Text('|'),
              TextButton(onPressed: onPressed, child: Text('F')),
            ],
          ),Row(
          children: [
            Column(
              children: [
                Text('HUMIDITY'),
                Text(humidity as String),
              ],
            ),Column(
              children: [
                Text('WIND'),
                Text(windKph as String),
              ],
            ),Column(
              children: [
                Text('UV'),
                Text(uv as String)
              ],
            ),

          ],
        )

        ],
        );
  }
}
