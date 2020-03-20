import 'dart:convert';

class Corona {
  final String country;

  final List<Data> data_list;

  Corona({this.country,this.data_list});



}

class Data {
  var date;

  var confirmed;

  var deaths;

  var recovered;

  Data({this.date,this.recovered,this.deaths,this.confirmed});
}
