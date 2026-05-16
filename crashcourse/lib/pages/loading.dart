import 'package:crashcourse/services/world_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading...';

void setupWorldTime() async {
WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
await instance.getTime();
 Navigator.pushReplacementNamed(context, '/home', arguments: {
  'location': instance.location,
  'flag': instance.flag,
  'time': instance.time,
  'isDaytime': instance.isDaytime,
 }); // remove loading screen
}


    @override
void initState() {
  super.initState();
 setupWorldTime();

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: const Color.fromARGB(255, 18, 1, 255),
          size: 100.0,
        ),
      ),
      
    );
  }
}