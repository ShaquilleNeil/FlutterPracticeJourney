import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    //set background
    String bgImage = data['isDaytime'] ? 'night.png' : 'day.png';
    

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/$bgImage'),
                
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 120.0, 20.0, 0.0), // Adjust the padding values as needed(20.0),
          
          child: Column(
            children: [
             TextButton(
                onPressed: () async{
                 
                dynamic result = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'time': result['time'],
                    'location': result['location'],
                    'isDaytime': result['isDaytime'],
                    'flag': result['flag'],
                  };
                });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.edit_location, color: Colors.blueAccent),
                    SizedBox(width: 8),
                    Text('Choose Location',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/${data['flag']}'),
                  ),
                  SizedBox(width: 10),
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 28,
                    letterSpacing: 2,
                      color: data['isDaytime'] ? Colors.black : Colors.white,
                  ),
                ),
              ],
              ),
          
              SizedBox(height: 20),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66,
                  color: data['isDaytime'] ? Colors.black : Colors.white,
                ),
              ),
            ],
          
          
          ),
          ),
        ),
      ),
    );
  }
}