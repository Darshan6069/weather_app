import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/modelclass.dart';

class WeatherProvider with ChangeNotifier{

  WeatherProvider(){
    getTempSharePrefrence();
    getThemeSharePrefrence();
  }

  bool isTheme = false;
  bool tempUnit = false;

  var data = searchList;



  ///---------------THEME-------------------
  set setTheme(value){
    isTheme = value;
    notifyListeners();
  }

  get getTheme{
    return isTheme;
  }

///----------------Temperature Unit---------------------
  set setTemp(value){
    tempUnit = value;
    notifyListeners();
  }

  get getTemp{
    return tempUnit;
  }

///-----------------Temperature------------------------
   setTempSharePrefrence(value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('Temp', value);
  }

  getTempSharePrefrence() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    tempUnit = pref.getBool('Temp') ??false;
  }


  ///-----------------SHAREPREF -- THEME--------------------------

  setThemeSharePrefrence(value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('Theme', value);
  }

  getThemeSharePrefrence() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isTheme = pref.getBool('Theme') ??false;
  }


}