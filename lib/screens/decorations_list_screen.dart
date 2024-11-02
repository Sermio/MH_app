import 'package:flutter/material.dart';
import 'package:mh_app/data/decoration.dart';
import 'package:mh_app/components/c_card.dart';
import 'package:mh_app/api/get_items_images.dart';
import 'package:mh_app/components/url_image_loader.dart';

class DecorationList extends StatelessWidget {
  final Future<List<ItemDecoration>> Function()
      loadDecorations; // Asegúrate de que esto sea Future<List<Decoration>>
  final String filterText;

  const DecorationList({
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
              final decoration = filteredDecorations[index];
              return Ccard(
                cardData: decoration,
                cardTitle: decoration.name,
                cardBody: _decorationBody(decoration.skills),
                cardSubtitle1: decoration.rarity.toString(),
                cardSubtitle2: decoration.slot.toString(),
                cardSubtitle1Label: "Rarity: ",
                cardSubtitle2Label: "Slot: ",
                leading: _decorationLeading(decoration.skills),
                trailing: SizedBox(
                  width: 25, // Ajusta el ancho según lo necesites
                  height: 25, // Ajusta la altura según lo necesites
                  // child: Image.network(
                  //   getDecorationSlotImage(decoration.slot),
                  //   fit: BoxFit.cover, // Ajusta cómo se debe escalar la imagen
                  // ),
                  child: Image.asset(
                    'assets/images/decorations/gem_level_${decoration.slot}.png',
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context)
                        .size
                        .width, // Ancho de la pantalla
                    height: MediaQuery.of(context)
                        .size
                        .height, // Alto de la pantalla
                  ),
                ),
                // cardTitleColor: getColorForProperty(decorations.name),
              );
            },
          );
        }
      },
    );
  }

  Column _decorationLeading(List<Skill> skills) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: skills.map((skill) {
        return SizedBox(
          width: 28, // Ajusta el ancho de la imagen
          height: 28, // Ajusta la altura de la imagen
          child: UrlImageLoader(
            itemName: skill.skillName,
            loadImageUrlFunction: getValidDecorationImageUrl,
          ),
        );
      }).toList(),
    );
  }

  Widget _decorationBody(List<Skill> skills) {
    return Column(
      children: skills.map((skill) {
        return Row(
          children: [
            Text(
              "${skill.skillName} ", // Skill name en texto normal
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              "+${skill.level}", // Skill level en negrita
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        );
      }).toList(),
    );
  }
}
