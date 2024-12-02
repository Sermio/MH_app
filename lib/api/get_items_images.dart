import 'package:http/http.dart' as http;

Future<String?> getValidMonsterImageUrl(String monsterName) async {
  List<String> urlVariations = [
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '-')}_render_001.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '_')}_render_001.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '-')}_render_002.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '_')}_render_002.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '-')}_render_001_(1).png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '-')}_render_001_(2).png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '-')}_render_002_(1).png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '-')}_render_002_(2).png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '_')}_render_001_(1).png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '_')}_render_001_(2).png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '_')}_render_002_(1).png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/mhw-${monsterName.toLowerCase().replaceAll(' ', '_')}_render_002_(2).png",
  ];

  for (String url in urlVariations) {
    final response = await http.head(Uri.parse(url));

    if (response.statusCode == 200) {
      return url;
    }
  }

  return null;
}

Future<String?> getValidDecorationImageUrl(String decorationName) async {
  List<String> urlVariations = [
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${decorationName.toLowerCase().replaceAll(' ', '-')}-skill-mhw.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${decorationName.toLowerCase().replaceAll(' ', '_')}-skill-mhw.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${decorationName.toLowerCase().replaceAll(' ', '-')}-skill-icon.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${decorationName.toLowerCase().replaceAll(' ', '_')}-skill-icon.png",
  ];

  const int maxRetries = 4;
  const Duration timeoutDuration = Duration(seconds: 2);

  for (String url in urlVariations) {
    for (int attempt = 0; attempt < maxRetries; attempt++) {
      try {
        final response =
            await http.head(Uri.parse(url)).timeout(timeoutDuration);
        if (response.statusCode == 200) {
          return url;
        }
      } catch (e) {
        if (attempt == maxRetries - 1) {
          print(
              "Error al cargar imagen en $url después de $maxRetries intentos.");
        }
      }
    }
  }

  return 'https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/evade-window-skill-mhw.png';
}

Future<String?> getValidLocationImageUrl(String locationName) async {
  List<String> urlVariations = [
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll(' ', '-')}-lvl1-small.jpg",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll("'", '-')}-lvl1-small.jpg",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll(' ', '-')}-lvl2-small.jpg",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll("'", '-')}-lvl2-small.jpg",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll(' ', '-')}-lvl3-small.jpg",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll("'", '-')}-lvl3-small.jpg",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll(' ', '_')}-level-1-small.jpg",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll("'", '_')}-level-1-small.jpg",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll(' ', '_')}-level-2-small.jpg",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll("'", '_')}-level-2-small.jpg",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll("'", '_')}-level-3-small.jpg",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll(' ', '_')}-level-3-small.jpg",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll(' ', '-')}-lvl1-small.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll("'", '-')}-lvl1-small.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll(' ', '-')}-lvl2-small.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll("'", '-')}-lvl2-small.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll(' ', '-')}-lvl3-small.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll("'", '-')}-lvl3-small.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll(' ', '_')}-level-1-small.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll("'", '_')}-level-1-small.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll(' ', '_')}-level-2-small.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll("'", '_')}-level-2-small.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll("'", '_')}-level-3-small.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${locationName.toLowerCase().replaceAll(' ', '_')}-level-3-small.png",
  ];

  for (String url in urlVariations) {
    final response = await http.head(Uri.parse(url));
    if (response.statusCode == 200) {
      return url;
    }
  }

  return null;
}

String getDecorationSlotImage(int slot) {
  if (slot == 4) {
    return 'https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/decoration_level_4_mhw_wiki.png';
  }
  return 'https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/gem_level_$slot.png';
}
