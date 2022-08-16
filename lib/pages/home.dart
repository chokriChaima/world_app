import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    
    // build method is where we recieve data 
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map; 
   
    // set background
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png' ;
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700] ;
    print(data);
    return Scaffold(
      backgroundColor: bgColor,
      // SafeArea requires a child widget
      body : SafeArea(
        child: Container(
          decoration: BoxDecoration(
            // DecorationImage allows us to apply an image to the entire BG
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover)
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child :Column(
              children: <Widget>[
              TextButton.icon(onPressed: () async {
                // pushed a page atop another
                dynamic result = await Navigator.pushNamed(context, '/location') ;
                setState(() {
                  data = {
                    'time' : result['time'],
                    'location': result['location'],
                    'flag' : result['flag'],
                    'isDayTime' : result['isDayTime'],
                  };
                });
              }, 
              icon: Icon(
                Icons.edit_location,
                color: Colors.grey[300]), 
              label: Text(
                 "Edit location",
                 style: TextStyle(
                 color : Colors.grey[300],
                )
                )
              ),
              SizedBox(height : 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   Text(
                      data['location'],
                      style: TextStyle(
                      fontSize : 28.0,
                      letterSpacing: 2.0,
                      color : Colors.white,
                    )
                   ),
                ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color : Colors.white,
                  ),
                )
            ],
            )
          ),
        ),
      )
    );
  }
}