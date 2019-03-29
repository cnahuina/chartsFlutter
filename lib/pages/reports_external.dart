import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReportsExternal extends StatefulWidget {
  @override
  _ReportsExternalState createState() => _ReportsExternalState();
}

class _ReportsExternalState extends State<ReportsExternal> {
  @override
  Widget build(BuildContext context) {
    var data = [
      Sales("Lun", 130, Colors.red),
      Sales("Mar", 70, Colors.green),
      Sales("Mie", 60, Colors.brown),
      Sales("Jue", 140, Colors.pink),
      Sales("Vie", 160, Colors.purple),
    ];

    var series = [
      charts.Series(
          domainFn: (Sales sales, _) => sales.day,
          measureFn: (Sales sales, _) => sales.sold,
          colorFn: (Sales sales, _) => sales.color,
          id: 'Sales',
          data: data,
          labelAccessorFn: (Sales sales, _) =>
              '${sales.day}: ${sales.sold.toString()}')
    ];
    var chart = charts.PieChart(
      series,
      defaultRenderer: charts.ArcRendererConfig(
          arcRendererDecorators: [charts.ArcLabelDecorator()], arcWidth: 100),
      animate: true,
    );

    return Scaffold(
      body: Container(
        alignment: Alignment(0.0,0.0),
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text("Según Alquiler",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                    fontSize: 25,
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.rectangle,
                  border:  Border.all(
                    color: Colors.blueGrey[200],
                    width: 2.5,
                  ),
                ),
                width: double.infinity,
                height: 320,
                child: InkWell(
                  child: chart,
                ),
              ),
            ],
          ),
      ),
    );
  }
}

class Sales {
  final String day;
  final int sold;
  final charts.Color color;

  Sales(this.day, this.sold, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
