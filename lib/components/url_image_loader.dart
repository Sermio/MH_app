// ImageURLLoader.dart

import 'package:flutter/material.dart';

class UrlImageLoader extends StatelessWidget {
  final String itemName;
  final Future<String?> Function(String)
      loadImageUrlFunction; // Función pasada como parámetro

  const UrlImageLoader({
    Key? key,
    required this.itemName,
    required this.loadImageUrlFunction, // Recibir la función como parámetro
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: loadImageUrlFunction(itemName), // Llamar a la función pasada
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            width: double.infinity,
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          ); // Cargando...
        } else if (snapshot.hasError || !snapshot.hasData) {
          return Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/canteen-monster-hunter-world-wiki-locations-npcs-felynes-skills.jpg"), // Usa la URL válida
                fit: BoxFit.contain,
              ),
            ), // Error o no hay imagen
            child: const Center(
              child: Text(
                "Image not found, but here's some food!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Color del texto
                  shadows: [
                    Shadow(
                      offset: Offset(1.0, 1.0), // Desplazamiento de la sombra
                      color:
                          Colors.black, // Color de la sombra (simula el borde)
                    ),
                    Shadow(
                      offset: Offset(-1.0, 1.0),
                      color: Colors.black,
                    ),
                    Shadow(
                      offset: Offset(1.0, -1.0),
                      color: Colors.black,
                    ),
                    Shadow(
                      offset: Offset(-1.0, -1.0),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            //Contenedor de imagen de URL
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(snapshot.data!), // Usa la URL válida
                fit: BoxFit.contain,
              ),
            ),
          );
        }
      },
    );
  }
}
