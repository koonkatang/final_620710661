import 'package:final_620710661/models/weather.dart';
import 'package:flutter/material.dart';
import 'package:final_620710661/repositories/weather_repository.dart';
//import 'package:public_toilets/screens/home/add_toilet.dart';
import 'package:final_620710661/screens/home/weather_list_item.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Weather>? _weather;
  var _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    getWeathers();
  }

  getWeathers() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    await Future.delayed(Duration(seconds: 2));

    try {
      var weathers = await WeatherRepository().getWeather();
      debugPrint('length of weathers: ${weathers.length}');

      setState(() {
        _weather = weathers;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    buildLoadingOverlay() => Container(
        color: Colors.black.withOpacity(0.2),
        child: Center(child: CircularProgressIndicator()));

    buildError() => Center(
        child: Padding(
            padding: const EdgeInsets.all(40.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(_errorMessage ?? '', textAlign: TextAlign.center),
              SizedBox(height: 32.0),
              ElevatedButton(onPressed: getWeathers, child: Text('Retry'))
            ])));

    buildWeather() {
      Container(child: WeatherListItem());
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Bangkok'),
        ),
        body: Stack(
          children: [
            if (_weather?.isNotEmpty ?? false) buildWeather(),
            if (_errorMessage != null) buildError(),
            if (_isLoading) buildLoadingOverlay()
          ],
        ));
  }


}
