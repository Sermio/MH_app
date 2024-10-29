import 'package:flutter/material.dart';
import 'package:mh_app/components/c_drawer.dart';
import 'package:mh_app/components/c_appbar.dart';

class SampleScreen extends StatelessWidget {
  SampleScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: Cappbar(scaffoldKey: _scaffoldKey),
        drawer: const Cdrawer(), // Añadimos el Drawer aquí
        body: const Center(
          child: Text(
            "text",
            style: TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
