import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final proVar = Provider.of<WeatherProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Settings',style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold
        ),),
        leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(CupertinoIcons.back,size: 30,)),
        shape: Border(
          bottom: BorderSide(width: 1)
        ),
      ),
      body:Column(
        children: [
          Container(
            height: 45,
            width: width,
            child: Text('Theme',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w400),),
            color: Colors.black12,
          ),
          Container(
            height: 50,
            width: width,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 8,
                      blurStyle: BlurStyle.outer,
                      spreadRadius: 1,
                      color:(proVar.getTheme == false)?Colors.black87:Colors.white70
                  )
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (proVar.isTheme==false)?Text('Light',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),):Text('Dark',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),),
                  Switch(
                      dragStartBehavior: DragStartBehavior.start,
                      value: proVar.getTheme, onChanged: (value){
                        proVar.setTheme = value;
                        proVar.setThemeSharePrefrence(value);
                  })
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Divider(thickness: 1, indent: 10,endIndent: 10,),
          Container(
            height: 45,
            width: width,
            child: Text('Temperature Unit',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w400),),
            color: Colors.black12,
          ),

          Container(
            height: 50,
            width: width,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 8,
                      blurStyle: BlurStyle.outer,
                      spreadRadius: 1,
                      color:(proVar.getTheme == false)?Colors.black87:Colors.white70
                  )
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (proVar.tempUnit==false)?Text('Celsius',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),):Text('Fanhrenheit',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),),
                  Switch(
                      dragStartBehavior: DragStartBehavior.start,
                      value: proVar.getTemp, onChanged: (value){
                    proVar.setTemp = value;
                    proVar.setTempSharePrefrence(value);
                  })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
