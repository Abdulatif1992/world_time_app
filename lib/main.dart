import 'package:flutter/material.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/', //default route
    routes: {
      '/': (context) =>
          Loading(), //agar initialRoute bo'lmaganda default Route bo'lardi
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
