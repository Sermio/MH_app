import 'package:flutter/material.dart';
import 'package:mh_app/data/monster.dart';

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
      return Colors.white;
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
    return null;
  }
}

Color? getColorForProperty(String element) {
  element = element.toLowerCase();
  if (element.contains('fire')) {
    return Colors.red;
  } else if (element.contains('water')) {
    return Colors.blue;
  } else if (element.contains('thunder')) {
    return Colors.yellow;
  } else if (element.contains('ice')) {
    return Colors.lightBlue;
  } else if (element.contains('dragon')) {
    return Colors.purple;
  } else {
    return null;
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
      return null;
  }
}

Color getColorForStars(int stars) {
  if (stars == 1) {
    return Colors.blue;
  } else if (stars == 2) {
    return Colors.orange;
  } else if (stars >= 3) {
    return Colors.red;
  } else {
    return Colors.grey;
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
