import 'package:flutter/material.dart';

class CcontainerPreview extends StatelessWidget {
  const CcontainerPreview({
    super.key,
    required this.overlayPortalController,
    required this.position,
    required this.content,
  });

  final OverlayPortalController overlayPortalController;
  final Offset position;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: overlayPortalController,
      overlayChildBuilder: (BuildContext context) {
        return Positioned(
          left: position.dx,
          top: position.dy,
          child: Container(
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(
              maxWidth: 300, // Limita el ancho máximo
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: content,

            // const Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Text(
            //       "Skill levels",
            //       style: TextStyle(fontWeight: FontWeight.bold),
            //     ),
            //     SizedBox(height: 8), // Espaciado entre textos
            //     Row(
            //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Flexible(
            //           child: Text(
            //             "Lvl: ",
            //             style: TextStyle(fontSize: 18),
            //             overflow: TextOverflow.ellipsis, // Previene overflow
            //           ),
            //         ),
            //         Flexible(
            //           child: Text(
            //             "Skill description by level",
            //             style: TextStyle(fontSize: 14),
            //             // overflow: TextOverflow.ellipsis, // Previene overflow
            //           ),
            //         ),
            //       ],
            //     ),
            //     Divider(),
            //     Row(
            //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Flexible(
            //           child: Text(
            //             "Lvl: ",
            //             style: TextStyle(fontSize: 18),
            //             overflow: TextOverflow.ellipsis, // Previene overflow
            //           ),
            //         ),
            //         Flexible(
            //           child: Text(
            //             "Skill description by level",
            //             style: TextStyle(fontSize: 14),
            //             // overflow: TextOverflow.ellipsis, // Previene overflow
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          ),
        );
      },
    );
  }
}
