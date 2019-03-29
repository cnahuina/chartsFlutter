import 'package:flutter/material.dart';
import 'package:reports_pelotero/pages/reports_external.dart';
import 'package:reports_pelotero/pages/reports_internal.dart';

class ReportsScreen extends StatefulWidget {
  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text:"Internos"),
                Tab(text:"Externos")
              ],
            ),
            title: Text('Reportes Pelotero'),
          ),
          body: TabBarView(
            children: [
              ReportsInternal(),
              ReportsExternal(),
            ],
          ),
        ),
      );
  }
}
