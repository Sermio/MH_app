// MonsterDetailsCard.dart

import 'package:flutter/material.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/utils/utils.dart';
import 'package:mh_app/components/c_chip.dart';

class MonsterDetailsCard extends StatelessWidget {
  final Monster monster;

  const MonsterDetailsCard({Key? key, required this.monster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                monster.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(monster.description),
                  const SizedBox(height: 15),
                  const Divider(
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Type: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        monster.type,
                      ),
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
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 2.0,
                    children: monster.location.map((loc) {
                      return Cchip(
                        // item: monster,
                        chipItem: loc,
                        itemName: loc.name ?? "",
                        getItemColor: zoneBackgroundColor,
                        optionalWidget: Image.asset(
                          'assets/images/map/map.png',
                          width: 16,
                          height: 16,
                          color: const Color.fromARGB(255, 120, 115, 115),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
