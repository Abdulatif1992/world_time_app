import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? location; //location name for the ui
  String? time; //the time in that location
  String? flag; // url to an asset flag icon
  String? url; // location url for api endpoint
  bool? isDaytime; // true or false if dayTime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.http('worldtimeapi.org', '/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //malumotlar kelgan ammo decode qilmasak foydalana olmasdik

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;

      //set the time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error $e');
      time = 'couldn\'t get time data';
    }
  }
}
