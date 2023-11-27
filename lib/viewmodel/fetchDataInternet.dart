import 'dart:convert';
import 'package:geocode/geocode.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/model_class.dart';
import 'package:weather_app/utility/service.dart';

Future<weatherModelClass> fetchAlbum() async {
  String apiKey = '364e3b54a58dfa9d9bc936371d222318';
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${apiKey}&units=metric'));
  print(latitude);
  print(longitude);
  print(response.body);

  if (response.statusCode == 200) {
    return weatherModelClass.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

convertingToLatLon(String cityy) async {
  GeoCode geoCode = GeoCode();

  try {
    Coordinates coordinates = await geoCode.forwardGeocoding(address: cityy);
    latitude = coordinates.latitude;
    longitude = coordinates.longitude;
  } catch (e) {
    print(e);
  }
}
