import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/data/decoration.dart';

class MonsterApi {
  static Future<List<Monster>> fetchMonsters() async {
    final url = Uri.parse('https://mhw-db.com/monsters');

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      // Asegúrate de que cada elemento sea del tipo correcto
      return data.map<Monster>((json) => Monster.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load monsters');
    }
  }
}

class DecorationApi {
  static Future<List<ItemDecoration>> fetchDecorations() async {
    final url = Uri.parse('https://mhw-db.com/decorations');

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      // Asegúrate de que cada elemento sea del tipo correcto
      return data
          .map<ItemDecoration>((json) => ItemDecoration.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load monsters');
    }
  }
}
