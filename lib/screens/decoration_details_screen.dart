import 'package:flutter/material.dart';
import 'package:mh_app/data/decoration.dart';
import 'package:mh_app/api/get_items_images.dart';
import 'package:mh_app/components/url_image_loader.dart';
import 'package:mh_app/components/c_back_button.dart';

class DecorationDetails extends StatelessWidget {
  const DecorationDetails({super.key, required this.decoration});

  final ItemDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${decoration.name} details'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Decoration Skills",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                                width: 50,
                                height: 50,
                                child: UrlImageLoader(
                                  itemName: skill.skillName,
                                  loadImageUrlFunction:
                                      getValidDecorationImageUrl,
                                ),
                              ),
                              const SizedBox(width: 18),
                              // Contenedor para el nombre y la descripción
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${skill.skillName} + ${skill.level}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
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
                  const SizedBox(
                      height: 80), // Espacio para que no cubra el botón
                ],
              ),
            ),
          ),
          const CbackButton(),
        ],
      ),
    );
  }
}
