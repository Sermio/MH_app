import 'package:http/http.dart' as http;

Future<String?> getValidMonsterImageUrl(String monsterName) async {
  // Lista de posibles URLs con variaciones
  List<String> urlVariations = [
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '-')}_render_001.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '-')}_render_001_(1).png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '-')}_render_001_(2).png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '-')}_render_002.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '-')}_render_002_(1).png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '-')}_render_002_(2).png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '_')}_render_001.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '_')}_render_001_(1).png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '_')}_render_001_(2).png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '_')}_render_002.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '_')}_render_002_(1).png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '_')}_render_002_(2).png",
  ];

  // Iterar sobre las variaciones de URL
  for (String url in urlVariations) {
    final response =
        await http.head(Uri.parse(url)); // Solo obtenemos los headers

    // Verificamos si la respuesta fue exitosa
    if (response.statusCode == 200) {
      return url; // Retorna la primera URL válida
    }
  }

  return null; // Si ninguna URL fue válida
}

Future<String?> getValidDecorationImageUrl(String decorationName) async {
  // Lista de posibles URLs con variaciones
  List<String> urlVariations = [
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${decorationName.toLowerCase().replaceAll(' ', '-')}-skill-mhw.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${decorationName.toLowerCase().replaceAll(' ', '-')}-skill-icon.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${decorationName.toLowerCase().replaceAll(' ', '_')}-skill-mhw.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${decorationName.toLowerCase().replaceAll(' ', '_')}-skill-icon.png",
  ];

  // Iterar sobre las variaciones de URL
  for (String url in urlVariations) {
    final response =
        await http.head(Uri.parse(url)); // Solo obtenemos los headers

    // Verificamos si la respuesta fue exitosa
    if (response.statusCode == 200) {
      return url; // Retorna la primera URL válida
    }
  }

  return 'https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/evade-window-skill-mhw.png'; // Si ninguna URL fue válida
}

String getDecorationSlotImage(int slot) {
  if (slot == 4) {
    return 'https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/decoration_level_4_mhw_wiki.png';
  }
  return 'https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/gem_level_$slot.png';
}