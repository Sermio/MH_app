// monster_attributes.dart

import 'package:flutter/material.dart';
import 'package:mh_app/data/monster.dart';

// Función para obtener debilidades elementales
List<Weakness> getElementWeakness(List<Weakness> weaknesses) {
  const List<String> elementTypes = [
    'fire',
    'water',
    'thunder',
    'dragon',
    'ice',
  ];
  return weaknesses
      .where((weakness) => elementTypes.contains(weakness.element))
      .toList();
}

// Función para obtener debilidades por enfermedades
List<Weakness> getAilmentsWeakness(List<Weakness> weaknesses) {
  const List<String> elementTypes = [
    'fire',
    'water',
    'thunder',
    'dragon',
    'ice',
  ];
  return weaknesses
      .where((weakness) => !elementTypes.contains(weakness.element))
      .toList();
}

// Función para obtener el color de fondo de la zona
Color zoneBackgroundColor(String zone) {
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
    case "Caverns of El Dorado":
      return Colors.yellow;
    case "Confluence of Fates":
      return Colors.cyan.shade100;
    default:
      return Colors.white; // Color por defecto
  }
}

IconData? getIconForElement(String element) {
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

IconData? getIconForAilment(String ailment) {
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

Color getColorForStars(int stars) {
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
