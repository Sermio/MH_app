// decoration_details.dart

import 'package:flutter/material.dart';
import 'package:mh_app/data/decoration.dart';
import 'package:mh_app/utils/overlay_controller.dart';
import 'package:mh_app/components/skill_item.dart';
import 'package:mh_app/components/skill_container_preview.dart';
import 'package:mh_app/components/c_preview_container.dart';

class DecorationDetails extends StatelessWidget {
  const DecorationDetails({Key? key, required this.decoration})
      : super(key: key);

  final ItemDecoration decoration;

  @override
  Widget build(BuildContext context) {
    final overlayController = OverlayController();

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
                        final GlobalKey gestureKey = GlobalKey();
                        return SkillItem(
                          skill: skill,
                          gestureKey: gestureKey,
                          onTap: () {
                            overlayController.toggleOverlay(
                              skillId: skill.skillId,
                              skillLevel: skill.level,
                              gestureKey: gestureKey,
                            );
                          },
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
            valueListenable: overlayController.overlayVisible,
            builder: (context, isVisible, child) {
              if (isVisible) {
                return ValueListenableBuilder<Offset>(
                  valueListenable: overlayController.overlayPosition,
                  builder: (context, position, child) {
                    return CcontainerPreview(
                      overlayPortalController:
                          overlayController.overlayPortalController,
                      position: position,
                      content: SkillContainerPreview(
                        skillId: overlayController.selectedSkillId.value,
                        skillLevel: overlayController.selectedSkillLevel.value,
                      ),
                    );
                  },
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
