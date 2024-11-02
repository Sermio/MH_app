import 'package:flutter/material.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/screens/monster_map_details_screen.dart';

class Cchip<T> extends StatelessWidget {
  // final T item;
  final T chipItem;
  final String itemName;
  final Color Function(String) getItemColor;

  const Cchip({
    Key? key,
    // required this.item,
    required this.chipItem,
    required this.itemName,
    required this.getItemColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MonsterMapDetails(
                    map: chipItem as MonsterLocation,
                  )),
        );
      },
      child: Chip(
        elevation: 5,
        shadowColor: Colors.black,
        backgroundColor: getItemColor(itemName),
        label: Text(
          itemName.isNotEmpty ? itemName : "Unknown",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
