import 'package:flutter/material.dart';
import 'package:mh_app/data/decoration.dart';

class DecorationDetails extends StatelessWidget {
  const DecorationDetails({super.key, required this.decoration});

  final ItemDecoration decoration;

  @override
  Widget build(BuildContext context) {
    // final List<Weakness> elementWeakness =
    //     getElementWeakness(decoration.weaknesses);
    // final List<Weakness> ailmentsWeakness =
    //     getAilmentsWeakness(decoration.weaknesses);

    return Scaffold(
      appBar: AppBar(
        title: Text('${decoration.name} details'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // DecorationImageLoader(monsterName: decoration.name),
              // DecorationDetailsCard(decoration: decoration),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [IconsList(elementWeakness, ailmentsWeakness)],
              // ),
              const SizedBox(height: 20), // Espacio antes del botón
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Regresa a la pantalla anterior
                },
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
