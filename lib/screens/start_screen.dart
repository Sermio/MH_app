import 'package:flutter/material.dart';
import 'package:mh_app/screens/card_list.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/api/gets.dart';
import 'package:mh_app/screens/monster_list_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  Future<List<Monster>> fetchMonsters() async {
    return await GetMonstersList.fetchMonsters();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CardList(
        fetchCardData: fetchMonsters,
        cardListWidget: (dynamic futureData, String filterText) {
          // futureData es ahora dynamic
          return MonsterList(
            loadMonsters: () async => futureData,
            filterText: filterText,
          );
        },
      ),
    );
  }
}
