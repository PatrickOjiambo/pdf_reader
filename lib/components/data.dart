import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
class Data{
final String name;
final String localTime;
final String temperature;
final String humidity;
final String windSpeed;
final String feelsLike;
final String icon;
final String description;

Data({required this.name, required this.localTime, required this.temperature, required this.humidity, required this.windSpeed, required this.feelsLike, required this.icon, required this.description});
factory Data.fromJson(Map<String, dynamic> json){
  return Data(
    name: json['location']['name'],
    localTime: json['location']['localtime'],
    temperature: json['current']['temp_c'].toString(),
    humidity: json['current']['humidity'].toString(),
    windSpeed: json['current']['wind_kph'].toString(),
    feelsLike: json['current']['feelslike_c'].toString(),
    icon: json['current']['condition']['icon'],
    description: json['current']['condition']['text'],
  );
}
Future<Data> getData() async{

  final response = await http.get(Uri.parse('https://api.weatherapi.com/v1/current.json?key=${dotenv.env['API_KEY']}&q=London&aqi=no'));
  if(response.statusCode == 200){
    return Data.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }else{
    throw Exception('Failed to load data');
  }
}
}

class Forecast{
  final String date;
  final String avgTemp;
  final String icon;
  final String maxwindKph;

  Forecast({required this.date, required this.avgTemp,required this.icon, required this.maxwindKph});
  factory Forecast.fromJson(Map<String, dynamic> json){
    return Forecast(
      date: json['date'],
      avgTemp: json['day']['avgtemp_c'].toString(),
      icon: json['day']['condition']['icon'],
      maxwindKph: json['day']['maxwind_kph'].toString(),
    );
  }
  Future<List<Forecast>> getForecast() async{
    final response = await http.get(Uri.parse('https://api.weatherapi.com/v1/forecast.json?key=${dotenv.env['API_KEY']}&q=London&days=4&aqi=no&alerts=no'));
    if(response.statusCode == 200){
      final parsed = jsonDecode(response.body)['forecast']['forecastday'].cast<Map<String, dynamic>>();
      return parsed.map<Forecast>((json) => Forecast.fromJson(json)).toList();
    }else{
      throw Exception('Failed to load data');
    }
  }
}