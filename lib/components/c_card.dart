import 'package:flutter/material.dart';
import 'package:mh_app/data/decoration.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/screens/monster_details.dart';
import 'package:mh_app/screens/decoration_details.dart';

class Ccard extends StatelessWidget {
  final dynamic cardData; // Cambiado a dynamic
  final String cardTitle;
  final Widget? cardBody; // Cambiado a Widget?
  String? cardSubtitle1 = "Subtitle1";
  String? cardSubtitle2 = "Subtitle2";
  String? cardSubtitle1Label = "cardSubtitle1Label";
  String? cardSubtitle2Label = "cardSubtitle2Label";
  final Widget? leading;
  final Widget? trailing;
  final Color? cardTitleColor;

  Ccard({
    Key? key,
    required this.cardData, // Usar cardData
    required this.cardTitle,
    this.cardBody, // Hacer que sea opcional
    this.cardSubtitle1,
    this.cardSubtitle2,
    this.cardSubtitle1Label,
    this.cardSubtitle2Label,
    this.leading,
    this.trailing,
    this.cardTitleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Verificar el tipo de cardData y redirigir a la pantalla correspondiente
        if (cardData is Monster) {
          // Redirigir a la pantalla de detalles del monstruo
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MonsterDetails(monster: cardData)),
          );
        } else if (cardData is ItemDecoration) {
          // Redirigir a la pantalla de detalles de la decoración
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DecorationDetails(decoration: cardData)),
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
          trailing: trailing,
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
              // Verificar si cardBody no es null
              if (cardBody != null) ...[
                cardBody!, // Usar el operador de null-assertion para forzar el uso
                const SizedBox(height: 5), // Espacio si hay descripción
              ],
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
