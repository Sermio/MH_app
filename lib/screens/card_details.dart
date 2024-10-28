import 'package:flutter/material.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/components/icons_list.dart';
import 'package:mh_app/components/monster_image_loader.dart';
import 'package:mh_app/components/monster_details_card.dart';
import 'package:mh_app/utils/monster_atributes.dart';

class CardDetails extends StatelessWidget {
  const CardDetails(this.monster, {super.key});

  final Monster monster;

  @override
  Widget build(BuildContext context) {
    final List<Weakness> elementWeakness =
        getElementWeakness(monster.weaknesses);
    final List<Weakness> ailmentsWeakness =
        getAilmentsWeakness(monster.weaknesses);

    return Scaffold(
      appBar: AppBar(
        title: Text('${monster.name} details'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              MonsterImageLoader(monsterName: monster.name),
              MonsterDetailsCard(monster: monster),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [IconsList(elementWeakness, ailmentsWeakness)],
              ),
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
