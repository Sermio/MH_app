import 'package:flutter/material.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/components/cCard.dart';
import 'package:mh_app/api/gets.dart';

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

  @override
  void initState() {
    super.initState();
    futureMonsters = MonsterApi.fetchMonsters();
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Monsters"),
        ),
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
                  labelText: 'Filter by name',
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
                        .where((monster) => monster.name
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
