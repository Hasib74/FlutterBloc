import 'dart:math';

import 'package:corona_app/Korona/Model/Chart/BarChart.dart';
import 'package:corona_app/Korona/Model/Corona.dart';
import 'package:equatable/equatable.dart';

abstract class CoronaState extends Equatable {
  CoronaState();
}

class CoronaInitial extends CoronaState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CoronaLoading extends CoronaState {
  @override
  // TODO: implement props
  List<Object> get props => [];

  @override
  String toString() {
    // TODO: implement toString
    return "loading";
  }
}

class CoronaLoaded extends CoronaState {
  Future<List<Corona>> corona_list;

  CoronaLoaded(this.corona_list);

  @override
  // TODO: implement props
  List<Object> get props => [corona_list];
}

class CoronaError extends CoronaState {
  String error = "Error to load";

  CoronaError(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

class BarChartSate extends CoronaState {
  List<BarChart> list_bar_chart;

  BarChartSate(this.list_bar_chart);

  @override
  // TODO: implement props
  List<Object> get props => [list_bar_chart];
}
