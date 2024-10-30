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
  if (element.contains('fire')) {
    return Icons.fireplace_outlined;
  } else if (element.contains('water')) {
    return Icons.water_drop;
  } else if (element.contains('thunder')) {
    return Icons.flash_on;
  } else if (element.contains('ice')) {
    return Icons.ac_unit;
  } else if (element.contains('dragon')) {
    return Icons.local_pizza;
  } else {
    return null; // Ícono por defecto
  }
}

Color? getColorForProperty(String element) {
  element = element.toLowerCase();
  if (element.contains('fire')) {
    return Colors.red; // Color para fuego
  } else if (element.contains('water')) {
    return Colors.blue; // Color para agua
  } else if (element.contains('thunder')) {
    return Colors.yellow; // Color para trueno
  } else if (element.contains('ice')) {
    return Colors.lightBlue; // Color para hielo
  } else if (element.contains('dragon')) {
    return Colors.purple; // Color para dragón
  } else {
    return null; // Color por defecto (puedes elegir uno si lo prefieres)
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

int countLocationImages(String location) {
  switch (location) {
    case 'Ancient Forest':
      return 3;
    case 'Coral Highlands':
      return 3;
    case 'Wildspire Waste':
      return 3;
    case 'Rotten Vale':
      return 3;
    case "Elder's Recess":
      return 2;
    default:
      return 0;
  }
}
