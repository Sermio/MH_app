import 'package:flutter/material.dart';
import 'package:mh_app/screens/card_list.dart';
import 'package:mh_app/screens/sample_screen.dart';

class Cdrawer extends StatelessWidget {
  const Cdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Sample'),
            onTap: () {
              // Lógica para navegar a la pantalla principal
              // Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SampleScreen()));
            },
          ),
          ListTile(
            title: const Text('Monsters'),
            onTap: () {
              // Lógica para navegar a la pantalla principal
              // Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CardList()));
            },
          ),
          // Añade más elementos según sea necesario
        ],
      ),
    );
  }
}
