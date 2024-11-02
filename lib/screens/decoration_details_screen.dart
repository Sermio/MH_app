import 'package:flutter/material.dart';
import 'package:mh_app/data/decoration.dart';
import 'package:mh_app/data/skill.dart';
import 'package:mh_app/api/gets.dart';
import 'package:mh_app/api/get_items_images.dart';
import 'package:mh_app/components/url_image_loader.dart';
import 'package:mh_app/components/c_preview_container.dart';

class DecorationDetails extends StatelessWidget {
  const DecorationDetails({Key? key, required this.decoration})
      : super(key: key);

  final ItemDecoration decoration;

  @override
  Widget build(BuildContext context) {
    final overlayPortalController = OverlayPortalController();
    final overlayVisible = ValueNotifier<bool>(false);
    final overlayPosition = ValueNotifier<Offset>(Offset.zero);
    final selectedSkillId = ValueNotifier<int>(0);
    final selectedSkillLevel = ValueNotifier<int>(0); // Añadir para el nivel

    return Scaffold(
      appBar: AppBar(
        title: Text('${decoration.name} details'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
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
                        final GlobalKey gestureKey =
                            GlobalKey(); // Clave única para cada habilidad
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: GestureDetector(
                                  key: gestureKey,
                                  onTap: () {
                                    toggleOverlay(
                                        skill.skillId,
                                        skill
                                            .level, // Pasar el nivel de habilidad
                                        gestureKey,
                                        overlayPortalController,
                                        overlayVisible,
                                        overlayPosition,
                                        selectedSkillId,
                                        selectedSkillLevel); // Agregar aquí
                                  },
                                  child: UrlImageLoader(
                                    itemName: skill.skillName,
                                    loadImageUrlFunction:
                                        getValidDecorationImageUrl,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 18),
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
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: overlayVisible,
            builder: (context, isVisible, child) {
              if (isVisible) {
                return ValueListenableBuilder<Offset>(
                  valueListenable: overlayPosition,
                  builder: (context, position, child) {
                    return CcontainerPreview(
                      overlayPortalController: overlayPortalController,
                      position: position,
                      content: previewContainerElements(
                        selectedSkillId.value,
                        selectedSkillLevel.value, // Pasar el nivel aquí
                      ),
                    );
                  },
                );
              }
              return Container(); // No muestra nada si no es visible
            },
          ),
        ],
      ),
    );
  }

  void toggleOverlay(
      int skillId,
      int skillLevel, // Recibir el nivel aquí
      GlobalKey gestureKey,
      OverlayPortalController overlayPortalController,
      ValueNotifier<bool> overlayVisible,
      ValueNotifier<Offset> overlayPosition,
      ValueNotifier<int> selectedSkillId,
      ValueNotifier<int> selectedSkillLevel) {
    // Agregar aquí
    if (gestureKey.currentContext != null) {
      final renderBox =
          gestureKey.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      final size = renderBox.size;

      overlayPosition.value = Offset(
        position.dx + size.width,
        position.dy + size.height,
      );

      selectedSkillId.value =
          skillId; // Actualiza el ID de la habilidad seleccionada
      selectedSkillLevel.value =
          skillLevel; // Actualiza el nivel de la habilidad seleccionada
      overlayVisible.value = !overlayVisible.value;

      if (overlayVisible.value) {
        overlayPortalController.show();
      } else {
        overlayPortalController.hide();
      }
    }
  }

  Widget previewContainerElements(int skillId, int skillLevel) {
    return FutureBuilder<SpecificSkill>(
      future: fetchDecorationSkill(
          skillId), // Llama a la función para obtener la habilidad
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (snapshot.hasData) {
          final skill = snapshot.data!;
          return ListView.separated(
            shrinkWrap: true, // Para que no ocupe todo el espacio
            physics:
                const NeverScrollableScrollPhysics(), // Deshabilitar el scroll
            itemCount: skill.ranks.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final rank = skill.ranks[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Lvl ${rank.level}: ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: rank.level == skillLevel
                            ? FontWeight.bold
                            : FontWeight.normal,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      rank.description,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              );
            },
          );
        }
        return Container(); // En caso de que no haya datos
      },
    );
  }

  Future<SpecificSkill> fetchDecorationSkill(int skillId) async {
    return await GetDecorationsList.fetchDecorationSkill(skillId);
  }
}
