// overlay_controller.dart

import 'package:flutter/material.dart';

class OverlayController {
  final OverlayPortalController overlayPortalController;
  final ValueNotifier<bool> overlayVisible;
  final ValueNotifier<Offset> overlayPosition;
  final ValueNotifier<int> selectedSkillId;
  final ValueNotifier<int> selectedSkillLevel;

  OverlayController()
      : overlayPortalController = OverlayPortalController(),
        overlayVisible = ValueNotifier<bool>(false),
        overlayPosition = ValueNotifier<Offset>(Offset.zero),
        selectedSkillId = ValueNotifier<int>(0),
        selectedSkillLevel = ValueNotifier<int>(0);

  void toggleOverlay({
    required int skillId,
    required int skillLevel,
    required GlobalKey gestureKey,
  }) {
    if (gestureKey.currentContext != null) {
      final renderBox =
          gestureKey.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      final size = renderBox.size;

      overlayPosition.value = Offset(
        position.dx + size.width,
        position.dy + size.height,
      );

      selectedSkillId.value = skillId;
      selectedSkillLevel.value = skillLevel;
      overlayVisible.value = !overlayVisible.value;

      if (overlayVisible.value) {
        overlayPortalController.show();
      } else {
        overlayPortalController.hide();
      }
    }
  }
}
