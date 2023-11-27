import 'package:geolocator/geolocator.dart';
import 'package:weather_app/utility/service.dart';


class location{
  
getCurrentPosition()async{
  position1 = await determinePosition();
  print('???${position1}???');
    latitude=position1?.latitude;
  longitude=position1?.longitude;
 
  
}
 Future<Position> determinePosition() async {
  
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }



  
}
