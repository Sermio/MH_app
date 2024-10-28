import 'package:flutter/material.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/components/icons_list.dart';

class CardDetails extends StatelessWidget {
  const CardDetails(this.monster, {super.key});

  final Monster monster;

  @override
  Widget build(BuildContext context) {
    List<Weakness> _getElementWeakness(List<Weakness> weaknesses) {
      const List<String> elementTypes = [
        'fire',
        'water',
        'thunder',
        'dragon',
        'ice'
      ];
      return weaknesses
          .where((weakness) => elementTypes.contains(weakness.element))
          .toList();
    }

    List<Weakness> _getAilmentsWeakness(List<Weakness> weaknesses) {
      const List<String> elementTypes = [
        'fire',
        'water',
        'thunder',
        'dragon',
        'ice'
      ];
      return weaknesses
          .where((weakness) => !elementTypes.contains(weakness.element))
          .toList();
    }

    final List<Weakness> elementWeakness =
        _getElementWeakness(monster.weaknesses);
    final List<Weakness> ailmentsWeakness =
        _getAilmentsWeakness(monster.weaknesses);

    Color _zoneBackgroundColor(String zone) {
      switch (zone) {
        case 'Ancient Forest':
          return Colors.green.shade500;
        case 'Coral Highlands':
          return Colors.pink.shade100;
        case 'Wildspire Waste':
          return Colors.yellow.shade700;
        case 'Rotten Vale':
          return Colors.brown.shade200;
        case "Elder's Recess":
          return Colors.grey.shade300;
        default:
          return Colors.white; // Ícono por defecto
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${monster.name} details'),
      ),
      body: SingleChildScrollView(
        // Cambiado a SingleChildScrollView
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity, // Ocupa todo el ancho disponible
                height: 200, // Ajusta la altura según lo que necesites
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/aptonoth-monster-hunter-world-small-monster.jpg",
                    ),
                    fit: BoxFit
                        .cover, // Mantiene la relación de aspecto y ocupa todo el contenedor
                  ),
                ),
              ),
              // SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          monster.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(monster.description),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                const Text(
                                  "Type: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  monster.type,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Species: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  monster.species,
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            Wrap(
                              spacing: 8.0,
                              runSpacing: 4.0,
                              children: monster.location.map((loc) {
                                return Chip(
                                  backgroundColor:
                                      _zoneBackgroundColor(loc.name ?? ""),
                                  label: Text(loc.name ?? "Unknown Location"),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
