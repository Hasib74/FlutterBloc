import 'package:corona_app/Korona/UI/Chart/Charts.dart';
import 'package:flutter/material.dart';

class CoronaDrawe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).pop();

            Navigator.of(context)
                .push(new MaterialPageRoute(builder: (context) => Charts()));
          },
          child: ListTile(
            leading: Icon(Icons.show_chart),
            title: Text("Chart"),
          ),
        )
      ],
    );
  }
}
