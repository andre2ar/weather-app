import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '9972c31c5b7b0ec460fbe3be4bfa38ee';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();

    getLocationAndData();
  }

  Future<void> getLocationAndData() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();

//    double temperature = decodedData['main']['temp'];
//    int condition = decodedData['weather'][0]['id'];
//    String cityName = decodedData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
