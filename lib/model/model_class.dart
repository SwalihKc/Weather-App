

weatherModelClass? weath;
class weatherModelClass {
  double? temp;
  int? humidity;
  num? windspeed;
  int? pressure;
  String? name;
  String? icon;
  weatherModelClass({
     this.temp,
     this.humidity,
     this.windspeed,
     this.pressure,
     this.name
  });
  weatherModelClass.fromJson(Map<String, dynamic> json) {
    temp = json["main"]["temp"];
    humidity =json['main']['humidity'];
    windspeed =json['wind']['speed'];
    pressure = json['main']['pressure'];
    name= json['name'];
    icon=json['weather'][0]['icon'];
   
  }
}
