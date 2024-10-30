import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mh_app/data/location.dart';
import 'package:mh_app/data/monster.dart';
import 'package:mh_app/data/decoration.dart';

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
}

class GetLocationDetails {
  static Future<Location> fetchLocationDetails(int locationId) async {
    // Eliminar la verificación de null ya que locationId es un int no null
    final url = Uri.parse('https://mhw-db.com/locations/$locationId');

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      // Aquí se espera que la respuesta sea un objeto JSON y no una lista
      final data = json.decode(response.body); // Decodificar directamente
      return Location.fromJson(data); // Crear y devolver un objeto Location
    } else {
      throw Exception('Failed to load Location Details');
    }
  }
}
