import 'package:flutter/material.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/components/icons_list.dart';
import 'package:mh_app/components/url_image_loader.dart';
import 'package:mh_app/components/monster_details_card.dart';
import 'package:mh_app/components/c_back_button.dart';
import 'package:mh_app/utils/utils.dart';
import 'package:mh_app/api/get_items_images.dart';

class MonsterDetails extends StatelessWidget {
  const MonsterDetails({super.key, required this.monster});

  final Monster monster;

  @override
  Widget build(BuildContext context) {
    final List<Weakness> elementWeakness =
        getElementWeakness(monster.weaknesses);
    final List<Weakness> ailmentsWeakness =
        getAilmentsWeakness(monster.weaknesses);

    return Scaffold(
      appBar: AppBar(
        title: Text('${monster.name} details'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  UrlImageLoader(
                    itemName: monster.name,
                    loadImageUrlFunction: getValidMonsterImageUrl,
                  ),
                  MonsterDetailsCard(monster: monster),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconsList(elementWeakness, ailmentsWeakness),
                    ],
                  ),
                  const SizedBox(height: 120),
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
