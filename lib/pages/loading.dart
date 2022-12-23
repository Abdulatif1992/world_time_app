import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //String time = 'loading';

  void setupWorldTime() async {
    WorldTime insttance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await insttance.getTime();
    await Future.delayed(Duration(seconds: 3));

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': insttance.location,
      'flag': insttance.flag,
      'time': insttance.time,
      'isDaytime': insttance.isDaytime,
    });

    // print(insttance.time);
    // setState(() {
    //   time = insttance.time!;
    // });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
