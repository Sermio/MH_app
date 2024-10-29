import 'package:flutter/material.dart';
import 'package:mh_app/screens/card_list.dart';
import 'package:mh_app/api/gets.dart';
import 'package:mh_app/components/c_monster_list.dart';
import 'package:mh_app/components/c_decorations_list.dart';
import 'package:mh_app/screens/sample_screen.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/data/decoration.dart';

class Cdrawer extends StatefulWidget {
  const Cdrawer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CdrawerState createState() => _CdrawerState();
}

class _CdrawerState extends State<Cdrawer> {
  Future<List<Monster>>? _monsterData; // Almacenaremos la llamada aquí
  Future<List<ItemDecoration>>?
      _decorationData; // Almacenaremos la llamada aquí

  Future<List<Monster>> fetchMonsters() async {
    _monsterData ??= MonsterApi.fetchMonsters();
    return _monsterData!;
  }

  Future<List<ItemDecoration>> fetchDecorations() async {
    _decorationData ??= DecorationApi.fetchDecorations();
    return _decorationData!;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(
                    'https://imgs.search.brave.com/zzQeygerqDO1dyV2rLzBDdAwpOrplEXSqDFS0F3Taz0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZS5hcGkucGxheXN0/YXRpb24uY29tL3Z1/bGNhbi9pbWcvcm5k/LzIwMjAxMC8wMTA2/L0l5WTNKU3pITkNW/b2g3RnVsdE1QYUU4/Ri5qcGc'),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Sample'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SampleScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Monsters'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CardList(
                      fetchCardData: fetchMonsters,
                      cardListWidget: (dynamic futureData, String filterText) {
                        return CmonsterList(
                          loadMonsters: () async => futureData,
                          filterText: filterText,
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Decorations'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CardList(
                      fetchCardData: fetchDecorations,
                      cardListWidget: (dynamic futureData, String filterText) {
                        return CdecorationList(
                          loadDecorations: () async => futureData,
                          filterText: filterText,
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
