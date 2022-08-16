import 'package:flutter/material.dart';

import '../services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({ Key? key }) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

   List<WorldTime> locations = [
    WorldTime( 'Europe/London', 'London','uk.png',false),
    WorldTime( 'Europe/Berlin',  'Athens', 'greece.png',false),
    WorldTime( 'Africa/Cairo', 'Cairo','egypt.png',false),
    WorldTime('Africa/Nairobi', 'Nairobi','kenya.png',false),
    WorldTime('America/Chicago', 'Chicago',  'usa.png',false),
    WorldTime( 'America/New_York', 'New York',  'usa.png',false),
    WorldTime( 'Asia/Seoul', 'Seoul', 'south_korea.png',false),
    WorldTime( 'Asia/Jakarta', 'Jakarta',  'indonesia.png',false),
  ];

  void updateTime(index) async
  {
    WorldTime instance = locations[index] ;
    await instance.getTime();
    Navigator.pop(context, {
      "location": instance.location,
      "time":instance.time,
      "flag": instance.flag,
      "isDayTime" : instance.isDayTime,
    });
  }
  @override
  Widget build(BuildContext context) {
 
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.blue[900],
         // gets rid of the weird shadow underneath
         elevation :0,
         centerTitle: true,
         title: Text('Choose a location'),
       ),
       body: ListView.builder(
         itemCount: locations.length,
         itemBuilder: (context , index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap:(){
                      updateTime(index);
                  } ,
                  title : Text(locations[index].location),
                  leading : CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  )
                )
              ),
            );
         })
    
      
    );
  }
}