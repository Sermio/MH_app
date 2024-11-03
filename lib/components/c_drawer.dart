import 'package:flutter/material.dart';
import 'package:mh_app/screens/card_list.dart';
import 'package:mh_app/api/gets.dart';
import 'package:mh_app/screens/monster_list_screen.dart';
import 'package:mh_app/screens/decorations_list_screen.dart';
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
    _monsterData ??= GetMonstersList.fetchMonsters();
    return _monsterData!;
  }

  Future<List<ItemDecoration>> fetchDecorations() async {
    _decorationData ??= GetDecorationsList.fetchDecorations();
    return _decorationData!;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            menuHeader(context),
            menuItems(context),
          ],
        ),
      ),
    );
  }

  Widget menuHeader(BuildContext context) {
    return Image.network(
      'https://imgs.search.brave.com/zzQeygerqDO1dyV2rLzBDdAwpOrplEXSqDFS0F3Taz0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZS5hcGkucGxheXN0/YXRpb24uY29tL3Z1/bGNhbi9pbWcvcm5k/LzIwMjAxMC8wMTA2/L0l5WTNKU3pITkNW/b2g3RnVsdE1QYUU4/Ri5qcGc',
      fit: BoxFit.cover, // Ajusta la imagen al tamaño del contenedor
    );
  }

  Widget menuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Wrap(
        runSpacing: 5,
        children: [
          Column(
            children: [
              ListTile(
                title: const Text('Sample'),
                // iconColor: Colors.orange,
                trailing: const Icon(
                  Icons.block,
                  size: 35,
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SampleScreen()),
                  );
                },
              ),
              ListTile(
                title: const Text('Monsters'),
                trailing: Image.asset(
                  'assets/images/drawer/monster_icon.png',
                  width: 35,
                  height: 35,
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CardList(
                              fetchCardData: fetchMonsters,
                              cardListWidget:
                                  (dynamic futureData, String filterText) {
                                return MonsterList(
                                  loadMonsters: () async => futureData,
                                  filterText: filterText,
                                );
                              },
                            )),
                  );
                },
              ),
              ListTile(
                title: const Text('Decorations'),
                trailing: Image.asset(
                  'assets/images/decorations/gem_level_4.png',
                  width: 35,
                  height: 35,
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CardList(
                              fetchCardData: fetchDecorations,
                              cardListWidget:
                                  (dynamic futureData, String filterText) {
                                return DecorationList(
                                  loadDecorations: () async => futureData,
                                  filterText: filterText,
                                );
                              },
                            )),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
