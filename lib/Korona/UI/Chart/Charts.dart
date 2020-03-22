import 'package:corona_app/Korona/Bloc/CoronaBloc.dart';
import 'package:corona_app/Korona/Bloc/CoronaEvent.dart';
import 'package:corona_app/Korona/Bloc/CoronaState.dart';
import 'package:corona_app/Korona/Model/Chart/BarChart.dart';
import 'package:corona_app/Korona/Utails/Common.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Charts extends StatefulWidget {
  Charts({Key key}) : super(key: key);

  @override
  _ChartsState createState() => new _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // BlocProvider.of<CoronaBloc>(context)..add(GetBarChart());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<CoronaBloc>(
        create: (context) => CoronaBloc()..add(GetBarChart()),
        child: Scaffold(
          appBar: new AppBar(
            title: new Text("Chart"),
          ),
          body: BlocBuilder<CoronaBloc, CoronaState>(
            builder: (context, state) {
              if (state is BarChartSate) {
                return loadBartChart(state.list_bar_chart);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget loadBartChart(List<BarChart> list_bar_chart) {
    return Text(list_bar_chart[0].date);
  }
}
