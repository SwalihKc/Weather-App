import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view/Splash_screen.dart';
import 'package:weather_app/model/ThemChange.dart';
import 'package:weather_app/utility/ssssss.dart';
import 'package:weather_app/viewmodel/fetchDataInternet.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    fetchAlbum();
    // TODO: implement initState
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (context) =>ThemeProvider())
      ],
      child: Consumer<ThemeProvider>(
        builder: (context,prov,cild) {
          return MaterialApp(
    
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              // theme: ThemeData(
              //   brightness: Brightness.light,
              //    useMaterial3: true,
              // ),
    
              theme: prov.changeThem ? themModel.darkMode : themModel.lightMode,
              home: splashscreen());
        }
      ),
    );
  }
}
