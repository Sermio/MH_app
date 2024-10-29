import 'package:flutter/material.dart';
import 'package:mh_app/data/decoration.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/screens/monster_details.dart';
import 'package:mh_app/screens/decoration_details.dart';

class Ccard extends StatelessWidget {
  final dynamic cardDataType; // Cambiado a dynamic
  final String cardTitle;
  final String cardDescription;
  String? cardSubtitle1 = "Subtitle1";
  String? cardSubtitle2 = "Subtitle2";
  String? cardSubtitle1Label = "cardSubtitle1Label";
  String? cardSubtitle2Label = "cardSubtitle2Label";
  final Icon? leading;
  final Color? cardTitleColor;

  Ccard({
    Key? key,
    required this.cardDataType, // Usar cardDataType
    required this.cardTitle,
    required this.cardDescription,
    this.cardSubtitle1,
    this.cardSubtitle2,
    this.cardSubtitle1Label,
    this.cardSubtitle2Label,
    this.leading,
    this.cardTitleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Verificar el tipo de cardDataType y redirigir a la pantalla correspondiente
        if (cardDataType is Monster) {
          // Redirigir a la pantalla de detalles del monstruo
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MonsterDetails(monster: cardDataType)),
          );
        } else if (cardDataType is ItemDecoration) {
          // Redirigir a la pantalla de detalles de la decoración
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DecorationDetails(decoration: cardDataType)),
          );
        }
        // else {
        //   // Redirigir a una pantalla por defecto
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => DefaultScreen()), // Cambia esto por tu pantalla por defecto
        //   );
        // }
      },
      child: Card(
        child: ListTile(
          leading: leading,
          title: Text(
            cardTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: cardTitleColor,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (cardDescription.isNotEmpty) Text(cardDescription),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    cardSubtitle1Label ?? "cardSubtitle1Label",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    cardSubtitle1 ?? "subtitle1",
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    cardSubtitle2Label ?? "cardSubtitle2Label",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    cardSubtitle2 ?? "subtitle2",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
