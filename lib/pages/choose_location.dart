import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'cairo.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'nairobi.png'),
    WorldTime(
        url: 'America/New_York', location: 'New York', flag: 'nairobi.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'nairobi.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'nairobi.png'),
    WorldTime(url: 'Asia/Tashkent', location: 'Tashkent', flag: 'nairobi.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Cheoose a location'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text('${locations[index].location}'),
            ),
          );
        },
      ),
    );
  }
}
