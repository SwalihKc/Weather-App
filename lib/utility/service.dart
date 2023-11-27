import 'package:geolocator/geolocator.dart';
import 'package:weather_app/model/forcastModel.dart';
import 'package:weather_app/model/model_class.dart';
import 'package:weather_app/viewmodel/fetchDataInternet.dart';
import 'package:weather_app/viewmodel/forcastData.dart';
Position?position1;
double? latitude;
double? longitude;
Future addFunction()async{
  weath = await fetchAlbum();
  forcastobj=await forcastFetch();
  
}