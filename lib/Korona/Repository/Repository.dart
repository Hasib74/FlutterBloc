import 'dart:convert';

import 'package:corona_app/Korona/Model/Chart/BarChart.dart';
import 'package:corona_app/Korona/Model/Corona.dart';
import 'package:corona_app/Korona/Utails/Common.dart';
import 'package:corona_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:random_color/random_color.dart';

abstract class CoronaRepository {
  Future<List<Corona>> loadAllData(url);

  List<BarChart> loadBarChart();
}

class LoadRepository extends CoronaRepository {
  @override
  Future<List<Corona>> loadAllData(url) async {
    List<Corona> _coronaList = [];

    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);

      map.forEach((key, value) {
        List<Data> data_list = new List();

        for (Map obj in value) {
          data_list.add(Data(
              date: obj["date"],
              confirmed: obj["confirmed"],
              deaths: obj["deaths"],
              recovered: obj["recovered"]));
        }
        _coronaList.add(Corona(country: key, data_list: data_list));
      });
    } else {
      print("Data can not read");
    }

    /// print("Value of ${_coronaList[1].data_list[0].date}");

    Common.corona_list = _coronaList;

    return _coronaList;
  }

  @override
  List<BarChart> loadBarChart() {
    List<BarChart> _bar_chart_list = [];

    var length = Common.corona_list.length;

    var coronaList = Common.corona_list;

    for (int i = 0; i < length; i++) {
      if (coronaList[i].country == "Bangladesh") {
        coronaList[i].data_list.forEach((element) {
          RandomColor _randomColor = RandomColor();

          Color _color = _randomColor.randomColor();

          _bar_chart_list.add(BarChart(
              date: element.date,
              casses: element.deaths,
              color: _color,
              click: false));
        });
      }
    }

    return _bar_chart_list;
  }
}
