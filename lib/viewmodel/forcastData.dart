import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/forcastModel.dart';
import 'package:weather_app/utility/service.dart';

Future<ForcastModel> forcastFetch() async {
  String apiKey = '364e3b54a58dfa9d9bc936371d222318';
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?lat=${latitude}&lon=${longitude}&appid=${apiKey}&units=metric'));
  print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.a
    return ForcastModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
