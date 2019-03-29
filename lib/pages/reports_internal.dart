import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReportsInternal extends StatefulWidget {
  @override
  _ReportsInternalState createState() => _ReportsInternalState();
}

class _ReportsInternalState extends State<ReportsInternal> {
  @override
  Widget build(BuildContext context) {
    var data=[
      Sales("Lun",230,Colors.red),
      Sales("Mar",50,Colors.green),
      Sales("Mie",80,Colors.blue),
      Sales("Jue",140,Colors.orange),
      Sales("Vie",70,Colors.purple),
    ];

    var series= [
      charts.Series(
          domainFn: (Sales sales,_)=>sales.day,
          measureFn: (Sales sales,_)=>sales.sold,
          colorFn: (Sales sales,_)=>sales.color,
          id: 'Sales',
          data: data,
          labelAccessorFn: (Sales sales,_)=>'${sales.day}: ${sales.sold.toString()}'
      )
    ];
    var chart = charts.PieChart(
      series,
      defaultRenderer: charts.ArcRendererConfig(
          arcRendererDecorators: [charts.ArcLabelDecorator()],
          arcWidth: 100
      ),
      animate: true,
    );

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("Según Ubicación",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
              fontSize: 25,)
            ),
            SizedBox(
              width: double.infinity,
              height: 400,
              child: chart,
            ),
          ],
        )
      ),
    );
  }
}

class Sales{
  final String day;
  final int sold;
  final charts.Color color;

  Sales(this.day, this.sold, Color color): this.color=charts.Color(r:color.red,g:color.green,b: color.blue,a:color.alpha);

}
