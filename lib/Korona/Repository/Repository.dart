import 'dart:convert';

import 'package:corona_app/Korona/Model/Corona.dart';
import 'package:corona_app/Korona/Utails/Common.dart';
import 'package:corona_app/main.dart';
import 'package:http/http.dart' as http;

abstract class CoronaRepository {
  Future<List<Corona>> loadAllData(url);
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

    return _coronaList;
  }
}
