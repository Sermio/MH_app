// skill_item.dart

import 'package:flutter/material.dart';
import 'package:mh_app/api/get_items_images.dart';
import 'package:mh_app/data/decoration.dart';
import 'package:mh_app/components/url_image_loader.dart';

class SkillItem extends StatelessWidget {
  final Skill skill;
  final GlobalKey gestureKey;
  final VoidCallback onTap;

  const SkillItem({
    Key? key,
    required this.skill,
    required this.gestureKey,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onTap: onTap,
              child: UrlImageLoader(
                itemName: skill.skillName,
                loadImageUrlFunction: getValidDecorationImageUrl,
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
  }
}
