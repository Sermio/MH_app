import 'package:flutter/material.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/components/c_card.dart';

class MonsterList extends StatelessWidget {
  final Future<List<Monster>> Function() loadMonsters;
  final String filterText;

  const MonsterList({
    Key? key,
    required this.loadMonsters,
    required this.filterText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Monster>>(
      future: loadMonsters(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No monsters found'));
        } else {
          final monsters = snapshot.data!;
          final filteredMonsters = monsters
              .where((monster) =>
                  monster.name
                      .toLowerCase()
                      .contains(filterText.toLowerCase()) ||
                  monster.type
                      .toLowerCase()
                      .contains(filterText.toLowerCase()) ||
                  monster.species
                      .toLowerCase()
                      .contains(filterText.toLowerCase()))
              .toList();

          if (filteredMonsters.isEmpty) {
            return const Center(child: Text('No monsters found'));
          }

          return ListView.builder(
            itemCount: filteredMonsters.length,
            itemBuilder: (context, index) {
              final monster = filteredMonsters[index];
              return Ccard(
                cardData: monster,
                cardTitle: monster.name,
                cardBody: _cardDescription(monster.description),
                cardSubtitle1: monster.type,
                cardSubtitle2: monster.species,
                cardSubtitle1Label: "Type: ",
                cardSubtitle2Label: "Species: ",
              );
            },
          );
        }
      },
    );
  }

  Text _cardDescription(String description) {
    return Text(
      description,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 14),
    );
  }
}
