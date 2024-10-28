import 'package:flutter/material.dart';

class RootScaffold {
  static void openDrawer(BuildContext context) {
    final scaffold = Scaffold.of(context); // Obtiene el ScaffoldState
    scaffold.openDrawer(); // Abre el drawer
  }
}

// TextButton(
//   onPressed: () {
//     RootScaffold.openDrawer(context);
//   },
//   child: Text('Open Drawer'),
// )
