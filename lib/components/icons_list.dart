import 'package:flutter/material.dart';
import 'package:mh_app/data/monster.dart';

class IconsList extends StatelessWidget {
  const IconsList(this.elementalWeaknesses, this.ailmentWeaknesses,
      {super.key});

  final List<Weakness> elementalWeaknesses;
  final List<Weakness> ailmentWeaknesses;

  IconData? _getIconForElement(String element) {
    switch (element) {
      case 'fire':
        return Icons.fireplace_outlined;
      case 'water':
        return Icons.water_drop;
      case 'thunder':
        return Icons.flash_on;
      case 'ice':
        return Icons.ac_unit;
      case 'dragon':
        return Icons.local_pizza;
      default:
        return null; // Ícono por defecto
    }
  }

  IconData? _getIconForAilment(String ailment) {
    switch (ailment) {
      case 'poison':
        return Icons.bubble_chart_sharp;
      case 'sleep':
        return Icons.hotel;
      case 'paralysis':
        return Icons.assist_walker;
      case 'blast':
        return Icons.drive_file_rename_outline_sharp;
      case 'stun':
        return Icons.airline_seat_legroom_extra_sharp;
      default:
        return null; // Ícono por defecto
    }
  }

  Color _getColorForStars(int stars) {
    if (stars == 1) {
      return Colors.blue; // Color para 1 estrella
    } else if (stars == 2) {
      return Colors.orange; // Color para 2 estrellas
    } else if (stars >= 3) {
      return Colors.red; // Color para 3 estrellas o más
    } else {
      return Colors.grey; // Color por defecto si no hay coincidencias
    }
  }

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
                    _getIconForElement(elementalWeakness.element),
                    size: 40.0,
                    color: _getColorForStars(elementalWeakness.stars),
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
                    _getIconForAilment(ailmentWeakness.element),
                    size: 40.0,
                    color: _getColorForStars(ailmentWeakness.stars),
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
