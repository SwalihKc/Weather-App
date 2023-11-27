import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  bool  changeThem =false;
  // get getbool{
  //   changeThem;}

  void gettheme(){
    changeThem=!changeThem;
    notifyListeners();
    
  }

}