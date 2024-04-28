import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider.dart';

import 'modelclass.dart';

class HourlyScreen extends StatefulWidget {
   HourlyScreen({super.key, required this.hour});
  final List<Hour>? hour;

  @override
  State<HourlyScreen> createState() => _HourlyScreenState();
}

class _HourlyScreenState extends State<HourlyScreen> {
  @override
  Widget build(BuildContext context) {
    final proVar = Provider.of<WeatherProvider>(context,listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('24 Hours',style: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget.hour!.length,
        itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
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
                Text(widget.hour![index].time!,style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),),
                 Container(
                   width: 135,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network("https:" +
                         widget.hour![index].condition!.icon!),
                      SizedBox(width: 6,),
                      (proVar.getTemp == false)? Text(
                        '${widget.hour![index].tempC.toString()}°C',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ):Text('${widget.hour![index].tempF.toString()}°F',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),),
                    ],
                  ),
                ),
                        ]  ),
            ),
          ),
        );
      },),
    );
  }
}
