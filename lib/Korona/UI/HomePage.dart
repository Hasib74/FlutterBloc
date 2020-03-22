import 'package:corona_app/Korona/Bloc/CoronaBloc.dart';
import 'package:corona_app/Korona/Bloc/CoronaEvent.dart';
import 'package:corona_app/Korona/Bloc/CoronaState.dart';
import 'package:corona_app/Korona/Drawer/CoronaDrawer.dart';
import 'package:corona_app/Korona/Model/Corona.dart';
import 'package:corona_app/Korona/UI/Chart/Charts.dart';
import 'package:corona_app/Korona/Utails/Common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final coronaBloc = BlocProvider.of<CoronaBloc>(context);
    coronaBloc.add(GetCoronaData(Common.url));

    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(child: new CoronaDrawe()),
        appBar: new AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>Charts()));
              },
              child: new IconButton(
                  icon: new Icon(
                    Icons.show_chart,
                    color: Colors.white,
                    size: 35,
                  )),
            )),
        body: BlocListener<CoronaBloc, CoronaState>(
          listener: (BuildContext context, state) {
            print("Currrent State = ${state}");
          },
          child: BlocBuilder<CoronaBloc, CoronaState>(
            builder: (context, state) {
              if (state is CoronaLoaded) {
                return FutureBuilder(
                  future: state.corona_list,
                  builder: (context, AsyncSnapshot<List<Corona>> snapshot) {
                    if (snapshot.hasError || snapshot.data == null) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  // sortAscending: true,
                                    sortColumnIndex: 2,
//                                columnSpacing: 25.0,
                                    //sortAscending: true,
                                    columns: [
                                      new DataColumn(label: Text("Country")),
                                      new DataColumn(label: Text("Date")),
                                      new DataColumn(
                                          label: Text("Confirmed"),
                                          onSort: (index, short) {
                                            print(index);
                                            print(short);
                                          }),
                                      new DataColumn(label: Text("Death")),
                                      new DataColumn(label: Text("Recovery")),
                                    ],
                                    rows: _rowList(snapshot.data)),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ));
  }

  List<DataRow> _rowList(List<Corona> corona) {
    List<DataRow> _data_row_list = [];

    if (corona != null) {
      for (int i = 0; i < corona.length; i++) {
        int dataListLength = corona[i].data_list.length;

        DataRow data_row = new DataRow(cells: [
          DataCell(new Text("${corona[i].country}")),
          DataCell(Center(
              child: new Text(
            "${corona[i].data_list[dataListLength - 1].date}",
            textAlign: TextAlign.center,
          ))),
          DataCell(
              Text("${corona[i].data_list[dataListLength - 1].confirmed}")),
          DataCell(Text("${corona[i].data_list[dataListLength - 1].deaths}")),
          DataCell(
              Text("${corona[i].data_list[dataListLength - 1].recovered}")),
        ]);

        _data_row_list.add(data_row);
      }
    }

    return _data_row_list;
  }
}
