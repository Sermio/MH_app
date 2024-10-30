import 'package:flutter/material.dart';

class CbackButton extends StatelessWidget {
  const CbackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0, // Espacio desde la parte inferior
      left: 20, // Espacio desde la izquierda
      right: 20, // Espacio desde la derecha
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Regresa a la pantalla anterior
            },
            child: const Text('Go Back'),
          ),
        ),
      ),
    );
  }
}
