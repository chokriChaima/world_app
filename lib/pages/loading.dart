import 'package:flutter/material.dart';
import 'package:world_time_project/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  void setUpWorldTime() async 
  {
    WorldTime instance = WorldTime("Europe/London","London","UK.png",false);
    // if you want to use the key word await, the function that we are waiting on must return a Future vamue
    await instance.getTime() ;

    // if you use Navigator.pushNamed you are simply passing a page atop another
    // Navigator.pushReplacementNamed replaces the cource page with the destination page
    // arguments is a Map
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      "location": instance.location,
      "time":instance.time,
      "flag": instance.flag,
      "isDayTime" : instance.isDayTime,
    });
    
  }
  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
        color: Colors.white,
        size: 80.0,),
      )
    );
  }
}