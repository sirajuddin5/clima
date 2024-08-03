
import 'package:clima/services/location.dart';
import 'package:clima/services/weather.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  late double latitude;
  late double longitude;


  void getLocationData() async{
    print('within get location method');

    WeatherModel weatherModel =WeatherModel();
    var weatherData =await weatherModel.getLocationWeather();

     Navigator.push(context, MaterialPageRoute(builder: (context){
       return LocationScreen(locationWeather: weatherData);
     }));

  }

  @override
  Widget build(BuildContext context) {
    print('screen created');
    getLocationData();
    return  Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );

  }

  @override
  void initState() {
    super.initState();
    Location location = Location();
    location.getCurrentLocation();
  }



  // void getData() async {
  //   http.Response response = await http.get(CALL as Uri);
  //   print(response);
  // }





  // void getData() async {
  //   print('within get data method');
  //   // String apiUrl = 'http://api.weatherapi.com/v1/current.json?key=87b81cda74b248a997e41152240104&q=Patna&aqi=yes';
  //   String apiUrl = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
  //   Uri url = Uri.parse(apiUrl);
  //   http.Response response = await http.get(url);
  //
  //   if(response.statusCode ==200){
  //     String data = response.body;
  //     var coordinates=jsonDecode(data)['coord'];
  //     var id = jsonDecode(data)['weather'][0]['id'];
  //     var temp = jsonDecode(data)['main']['temp'];
  //     var city = jsonDecode(data)['name'];
  //
  //     print(coordinates);
  //     print(id);
  //     print(temp);
  //     print(city);
  //   }else{
  //     print(response.statusCode);
  //   }
  //   // print(response.statusCode);
  //   // print(response.request);
  //   // print(response.body); // Print the response body
  // }

}

