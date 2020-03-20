import 'package:corona_app/Korona/Bloc/CoronaBloc.dart';
import 'package:corona_app/Korona/UI/HomePage.dart';
import 'package:corona_app/Weather/Bloc/weather/bloc.dart';
import 'package:corona_app/Weather/Repository/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Weather/UI/WeatherSearchPage.dart';

void main() => runApp(MaterialApp(
      home: WeatherApp(),
    ));

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Corona  App",
      home: BlocProvider(
          create: (context) => CoronaBloc(),
          child: HomePage()),
    );
  }
}
