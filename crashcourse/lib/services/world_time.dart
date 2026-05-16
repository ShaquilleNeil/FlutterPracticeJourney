import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';


class WorldTime {

    late String location; //location name for the UI
    late String time; //the time in that location
    late String flag; //url to an asset flag icon
    late String url; //location url for api endpoint
    late bool isDaytime; //true or false if daytime or not

WorldTime({required this.location, required this.flag, required this.url});

    //asynchronous function to get the time from the world time api
Future<void> getTime() async {
   try {
        //make request
   Response response = await get(Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=$url'));
   Map data = jsonDecode(response.body);
   print(data.keys);

 DateTime datetime = DateTime(
  data['year'],
  data['month'],
  data['day'],
  data['hour'],
  data['minute'],
  data['seconds'],
);

print(datetime);

isDaytime = datetime.hour > 6 && datetime.hour < 20 ? true : false;
//set time property
time = DateFormat.jm().format(datetime); 
   } catch (e) {
        print('caught error: $e');
   }

}


}