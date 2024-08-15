import 'package:flutter/material.dart';
import 'package:worldtimeapp/package/choose_location.dart';
import 'package:worldtimeapp/package/home.dart';
import 'package:worldtimeapp/package/loading.dart';
void main() {
  runApp( MaterialApp(
  initialRoute: '/',
      routes: {
        '/':(context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const Choose_location(),
      },
  ));
}
