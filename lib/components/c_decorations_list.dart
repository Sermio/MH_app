import 'package:flutter/material.dart';
import 'package:mh_app/data/decoration.dart';
import 'package:mh_app/components/c_card.dart';
import 'package:mh_app/utils/monster_atributes.dart';

class CdecorationList extends StatelessWidget {
  final Future<List<ItemDecoration>> Function()
      loadDecorations; // Asegúrate de que esto sea Future<List<Decoration>>
  final String filterText;

  const CdecorationList({
    Key? key,
    required this.loadDecorations,
    required this.filterText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ItemDecoration>>(
      future: loadDecorations(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No decorations found'));
        } else {
          final decorations = snapshot.data!;
          final filteredDecorations = decorations
              .where((decoration) =>
                  decoration.name
                      .toLowerCase()
                      .contains(filterText.toLowerCase()) ||
                  decoration.skills
                      .toString()
                      .toLowerCase()
                      .contains(filterText.toLowerCase()) ||
                  decoration.rarity
                      .toString()
                      .toLowerCase()
                      .contains(filterText.toLowerCase()))
              .toList();

          if (filteredDecorations.isEmpty) {
            return const Center(child: Text('No decorations found'));
          }

          return ListView.builder(
            itemCount: filteredDecorations.length,
            itemBuilder: (context, index) {
              final decorations = filteredDecorations[index];
              return Ccard(
                cardDataType: decorations,
                cardTitle: decorations.name,
                cardDescription: "",
                cardSubtitle1: decorations.rarity.toString(),
                cardSubtitle2: decorations.slot.toString(),
                cardSubtitle1Label: "Rarity: ",
                cardSubtitle2Label: "Slot: ",
                leading: Icon(
                  Icons.diamond,
                  color: getColorForProperty(decorations.name),
                  size: 50,
                ),
                // cardTitleColor: getColorForProperty(decorations.name),
              );
            },
          );
        }
      },
    );
  }
}
