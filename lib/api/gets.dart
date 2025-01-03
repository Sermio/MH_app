import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mh_app/data/location.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/data/decoration.dart';
import 'package:mh_app/data/skill.dart';

class GetMonstersList {
  static Future<List<Monster>> fetchMonsters() async {
    final url = Uri.parse('https://mhw-db.com/monsters');

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map<Monster>((json) => Monster.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load monsters');
    }
  }
}

class GetDecorationsList {
  static Future<List<ItemDecoration>> fetchDecorations() async {
    final url = Uri.parse('https://mhw-db.com/decorations');

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data
          .map<ItemDecoration>((json) => ItemDecoration.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load monsters');
    }
  }

  static Future<SpecificSkill> fetchDecorationSkill(int skillId) async {
    final url = Uri.parse('https://mhw-db.com/skills/$skillId');

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return SpecificSkill.fromJson(data);
    } else {
      throw Exception('Failed to load Decoration Skill Details');
    }
  }
}

class GetLocationDetails {
  static Future<Location> fetchLocationDetails(int locationId) async {
    final url = Uri.parse('https://mhw-db.com/locations/$locationId');

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Location.fromJson(data);
    } else {
      throw Exception('Failed to load Location Details');
    }
  }
}
