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
              image: DecorationImage(
                image: NetworkImage(
                    'https://imgs.search.brave.com/zzQeygerqDO1dyV2rLzBDdAwpOrplEXSqDFS0F3Taz0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZS5hcGkucGxheXN0/YXRpb24uY29tL3Z1/bGNhbi9pbWcvcm5k/LzIwMjAxMC8wMTA2/L0l5WTNKU3pITkNW/b2g3RnVsdE1QYUU4/Ri5qcGc'), // URL de la imagen
                fit: BoxFit.cover, // Ajusta la imagen a todo el espacio
              ),
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
          ListTile(
            title: const Text('Decorations'),
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
