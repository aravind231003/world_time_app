

import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/loading.dart';
void main() {
  runApp( MaterialApp(
    initialRoute: '/',
    routes: {
      '/home':(context)=> const Home(),
      '/':(context)=> const Loading(),
      '/location':(context)=> const ChooseLocation()
    },
  ));
}

