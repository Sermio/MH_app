import 'package:flutter/material.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/components/c_card.dart';

class CmonsterList extends StatelessWidget {
  final Future<List<Monster>> Function()
      loadMonsters; // Asegúrate de que esto sea Future<List<Monster>>
  final String filterText;

  const CmonsterList({
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
      description, // Asegúrate de que sea un String
      maxLines: 2, // Puedes ajustar este número según lo necesites
      overflow: TextOverflow
          .ellipsis, // Agrega '...' al final si el texto es muy largo
      style:
          const TextStyle(fontSize: 14), // Ajusta el estilo según lo necesites
    );
  }
}
