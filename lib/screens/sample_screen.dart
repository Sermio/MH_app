import 'package:flutter/material.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/components/c_drawer.dart';

class SampleScreen extends StatelessWidget {
  late Future<List<Monster>> futureMonsters;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          // title: const Text("Monsters"),
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer(); // Abre el Drawer
            },
          ),
        ),
        drawer: const Cdrawer(), // Añadimos el Drawer aquí
        body: const Center(
          child: Text(
            "text",
            style: const TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
