import 'package:flutter/material.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/utils/monster_atributes.dart';

class IconsList extends StatelessWidget {
  const IconsList(this.elementalWeaknesses, this.ailmentWeaknesses,
      {super.key});

  final List<Weakness> elementalWeaknesses;
  final List<Weakness> ailmentWeaknesses;

  @override
  Widget build(BuildContext context) {
    bool hasAilmentWithMoreThanOneStar =
        ailmentWeaknesses.any((ailment) => ailment.stars > 1);
    bool hasElementWithMoreThanOneStar =
        elementalWeaknesses.any((element) => element.stars > 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (hasElementWithMoreThanOneStar) ...[
          const Text(
            "Elemental Weaknesses",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: elementalWeaknesses
                .where((elementalWeakness) => elementalWeakness.stars > 1)
                .map((elementalWeakness) {
              return Column(
                children: [
                  Icon(
                    getIconForElement(elementalWeakness.element),
                    size: 40.0,
                    color: getColorForStars(elementalWeakness.stars),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(elementalWeakness.stars, (index) {
                      return const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 223, 206, 48),
                        size: 15,
                      );
                    }),
                  ),
                ],
              );
            }).toList(),
          ),
          const SizedBox(
              height: 10), // Espacio antes de los Ailments Weaknesses
        ],
        if (hasAilmentWithMoreThanOneStar) ...[
          const Text(
            "Ailments Weaknesses",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: ailmentWeaknesses
                .where((ailmentWeaknes) => ailmentWeaknes.stars > 1)
                .map((ailmentWeakness) {
              return Column(
                children: [
                  Icon(
                    getIconForAilment(ailmentWeakness.element),
                    size: 40.0,
                    color: getColorForStars(ailmentWeakness.stars),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(ailmentWeakness.stars, (index) {
                      return const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 223, 206, 48),
                        size: 15,
                      );
                    }),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}
