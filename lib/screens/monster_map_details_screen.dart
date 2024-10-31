import 'package:flutter/material.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/data/location.dart';
import 'package:mh_app/api/gets.dart';
import 'package:mh_app/utils/utils.dart';
import 'package:mh_app/components/c_back_button.dart';

class MonsterMapDetails<T> extends StatelessWidget {
  const MonsterMapDetails({super.key, required this.map});

  final MonsterLocation map;

  Future<Location> fetchLocation() async {
    return await GetLocationDetails.fetchLocationDetails(map.id);
  }

  void _showFullImage(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor:
            Colors.transparent, // Elimina el fondo blanco del dialog
        insetPadding:
            const EdgeInsets.all(10), // Reduce los márgenes del diálogo
        child: GestureDetector(
          onTap: () =>
              Navigator.of(context).pop(), // Cierra la imagen al tocar fuera
          child: Center(
            child: InteractiveViewer(
              maxScale: double.infinity,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                width:
                    MediaQuery.of(context).size.width, // Ancho de la pantalla
                height:
                    MediaQuery.of(context).size.height, // Alto de la pantalla
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${map.name} details'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FutureBuilder<Location>(
                    future: fetchLocation(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData) {
                        return const Text("No locations available");
                      }

                      final location = snapshot.data!;
                      final String imageName = (map.name ?? "")
                          .toLowerCase()
                          .replaceAll(' ', '-')
                          .replaceAll("'", '-');
                      final String imageFolder =
                          (map.name ?? "").replaceAll(' ', '-');

                      // Definiendo las imágenes de forma dinámica
                      List<String> imageFiles = [];
                      for (int i = 1;
                          i <= countLocationImages(map.name ?? "");
                          i++) {
                        imageFiles.add(
                            'assets/images/maps/$imageFolder/$imageName$i.png');
                      }

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: imageFiles.asMap().entries.map((entry) {
                              int index = entry.key; // Índice de la iteración
                              String image =
                                  entry.value; // Valor actual (la imagen)

                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                child: Column(
                                  children: [
                                    Text(
                                      'Level ${index + 1}:',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _showFullImage(context, image);
                                      },
                                      child: SizedBox(
                                        child: Image.asset(image),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 20),
                          const Center(
                            child: Text(
                              'Camps',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                            child: Divider(
                              height: 5,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Mostrar lista de camps
                          if (location.camps != null &&
                              location.camps.isNotEmpty)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: location.camps.map((camp) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        camp.name,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Zone: ${camp.zone}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            )
                          else
                            const Center(
                              child: Text(
                                "No camps available",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          const SizedBox(
                              height:
                                  100), // Espacio para asegurar que el texto no sea cubierto
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const CbackButton(), // Puedes ajustar la posición y el padding según sea necesario
        ],
      ),
    );
  }
}
