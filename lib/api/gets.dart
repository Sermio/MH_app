import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mh_app/data/monster.dart';

class MonsterApi {
  static Future<List<Monster>> fetchMonsters() async {
    final url = Uri.parse('https://mhw-db.com/monsters');

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Monster.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load monsters');
    }
  }
}
