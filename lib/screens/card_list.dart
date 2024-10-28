import 'package:flutter/material.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/components/c_card.dart';
import 'package:mh_app/api/gets.dart';
import 'package:mh_app/components/c_drawer.dart';

class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  State<CardList> createState() {
    return _CardListState();
  }
}

class _CardListState extends State<CardList> {
  late Future<List<Monster>> futureMonsters;
  String filterText = '';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    futureMonsters = MonsterApi.fetchMonsters();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          // title: const Text("Monsters"),
          flexibleSpace: const Image(
            image: NetworkImage(
              'https://imgs.search.brave.com/zhv-L9v2fmQDgEQq2MmUzlCnei_-wFyLnBgOoxJkTjk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZS5hcGkucGxheXN0/YXRpb24uY29tL3Z1/bGNhbi9pbWcvY2Zu/LzExMzA3bFd1VWhN/SUs4bHZrbEdMc2Vm/Wi1jdE5nTzdmeVlH/aGEzQUpEM1A2Y2RQ/TURtQUpoSmxkRU5m/dUxaTGJfYmdnVVhV/TFl5TndYVWVSZjZo/ZG85bWRhOTh5aGFQ/VS5wbmc',
            ),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.menu_outlined,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer(); // Abre el Drawer
            },
          ),
        ),
        drawer: const Cdrawer(), // Añadimos el Drawer aquí
        body: Column(
          children: [
            // Campo de texto para el filtro
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    filterText = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Filter by name, type, or species',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ),
            // Lista de monstruos con filtro aplicado
            Expanded(
              child: FutureBuilder<List<Monster>>(
                future: futureMonsters,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No monsters found'));
                  } else {
                    final monsterList = snapshot.data!
                        .where((monster) =>
                            monster.name
                                .toLowerCase()
                                .contains(filterText.toLowerCase()) ||
                            monster.type
                                .toLowerCase()
                                .contains(filterText.toLowerCase()) ||
                            monster.species
                                .toLowerCase()
                                .contains(filterText.toLowerCase()))
                        .toList();

                    return ListView.builder(
                      itemCount: monsterList.length,
                      itemBuilder: (context, index) {
                        final monster = monsterList[index];
                        return Ccard(monster: monster);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
