import 'package:flutter/material.dart';
import 'package:weather_app/HomePage.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }     
}





//https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={364e3b54a58dfa9d9bc936371d222318}
