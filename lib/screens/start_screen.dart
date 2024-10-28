import 'package:flutter/material.dart';
import 'package:mh_app/screens/card_list.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Monsters'),
              onTap: () {
                // Navegar a la pantalla de CardList
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const CardList()),
                );
              },
            ),
            // Puedes agregar más elementos al menú aquí
          ],
        ),
      ),
      body: Center(
        child: const Text('Welcome to the Main Screen!'),
      ),
    );
  }
}
