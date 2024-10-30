import 'package:flutter/material.dart';
import 'package:mh_app/screens/card_list.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/api/gets.dart';
import 'package:mh_app/components/c_monster_list.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  Future<List<Monster>> fetchMonsters() async {
    return await GetMonstersList.fetchMonsters();
  }

  @override
  Widget build(BuildContext context) {
    return CardList(
      fetchCardData: fetchMonsters,
      cardListWidget: (dynamic futureData, String filterText) {
        // futureData es ahora dynamic
        return CmonsterList(
          loadMonsters: () async => futureData,
          filterText: filterText,
        );
      },
    );
  }
}
