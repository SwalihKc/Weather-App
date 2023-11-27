// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:weather_app/utility/service.dart';
import 'package:weather_app/view/HomePage.dart';
import 'package:weather_app/viewmodel/goeLocator.dart';

class splashscreen extends StatefulWidget {
  
   splashscreen({super.key,});

  @override
  
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
     splash();
      location().getCurrentPosition();
    // TODO: implement initState
    super.initState();
    
  }
  Future <void>splash()async{
     
    await Future.delayed(const Duration(seconds: 3));
     await latitude ==null?
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  MyHomePage(),)):CircularProgressIndicator();
       

  }
  Widget build(BuildContext context) {
    
    return Center(child: Image.asset('assets/output-onlinegiftools.gif',scale: 5.0,),);
  }
}