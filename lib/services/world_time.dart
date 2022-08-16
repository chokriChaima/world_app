import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
 
  String location ; // location name for the UI
  late String time ; // Time in specific location 
  String flag ; //URL to asset flag icon 
  String url ; 
  bool isDayTime ; // true or false if daytime or not
  WorldTime(this.url,this.location, this.flag, this.isDayTime );
  
  Future<void> getTime() async 
 {
   try 
   {
      Response response = await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
     
      // get proporties from data
      String datetime =  data['datetime'] ;
      String offset = data['utc_offset'].substring(1,3);

      //print(datetime);
      DateTime now = DateTime.parse(datetime);
      
      // updated time
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 20  ? true : false ;
      
      // set the time property
      time = DateFormat.jm().format(now);

      
    } 
    catch (e)
    {
      print('Caught error:$e');
      time = "could not get time data";
    }
  }  


}

//WorldTime wt = WorldTime("London","UK.png","APIendPoint");
