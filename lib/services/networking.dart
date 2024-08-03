import 'dart:convert';
import 'package:http/http.dart' as http;


class NetworkHelper{
  final String apiUrl;

  NetworkHelper({required this.apiUrl});

  Future getData() async{
    // String apiUrl = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
    Uri url = Uri.parse(apiUrl);
    http.Response response = await http.get(url);
    if(response.statusCode ==200){
      String data = response.body;
      return jsonDecode(data);
      // print(coordinates);
      // print(id);
      // print(temp);
      // print(city);
    }else{
      print(response.statusCode);
    }
  }
}