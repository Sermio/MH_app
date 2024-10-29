import 'package:flutter/material.dart';
import 'package:mh_app/data/decoration.dart';
import 'package:mh_app/api/get_items_images.dart';
import 'package:mh_app/components/url_image_loader.dart';

class DecorationDetails extends StatelessWidget {
  const DecorationDetails({super.key, required this.decoration});

  final ItemDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${decoration.name} details'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Decoration Skills",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              if (decoration.skills.isNotEmpty) ...[
                Column(
                  children: decoration.skills.map((skill) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Contenedor para la imagen
                          SizedBox(
                            width: 50, // Ajusta el ancho de la imagen
                            height: 50, // Ajusta la altura de la imagen
                            child: UrlImageLoader(
                              itemName: skill.skillName,
                              loadImageUrlFunction: getValidDecorationImageUrl,
                            ),
                          ),
                          const SizedBox(
                              width:
                                  18), // Espacio entre la imagen y la descripción
                          // Contenedor para el nombre y la descripción
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Contenedor para el nombre de la habilidad

                                // width:
                                //     100, // Ajusta el ancho fijo según sea necesario
                                Text(
                                  "${skill.skillName} + ${skill.level}",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow
                                      .ellipsis, // Evita desbordamientos
                                ),

                                // Descripción de la habilidad
                                Text(
                                  skill.description,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ] else ...[
                const Text("No skills available"),
              ],
              const SizedBox(height: 20), // Espacio antes del botón
              Center(
                // Envuelve el botón con Center
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Regresa a la pantalla anterior
                  },
                  child: const Text('Go Back'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
