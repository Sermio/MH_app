import 'package:http/http.dart' as http;

Future<String?> getValidMonsterImageUrl(String monsterName) async {
  // Lista de posibles URLs con variaciones
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
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${decorationName.toLowerCase().replaceAll(' ', '_')}-skill-mhw.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${decorationName.toLowerCase().replaceAll(' ', '-')}-skill-icon.png",
    "https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/${decorationName.toLowerCase().replaceAll(' ', '_')}-skill-icon.png",
  ];

  // Define el tiempo de espera y el número máximo de reintentos
  const int maxRetries = 4;
  const Duration timeoutDuration = Duration(seconds: 2);

  for (String url in urlVariations) {
    for (int attempt = 0; attempt < maxRetries; attempt++) {
      try {
        // Hacemos una solicitud HTTP de encabezado con timeout
        final response = await http
            .head(Uri.parse(url))
            .timeout(timeoutDuration); // Tiempo de espera

        if (response.statusCode == 200) {
          return url; // Retorna la primera URL válida
        }
      } catch (e) {
        // Ignora los errores y pasa al siguiente intento
        if (attempt == maxRetries - 1) {
          print(
              "Error al cargar imagen en $url después de $maxRetries intentos.");
        }
      }
    }
  }

  // URL de imagen por defecto
  return 'https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/evade-window-skill-mhw.png';
}

Future<String?> getValidLocationImageUrl(String locationName) async {
  // Lista de posibles URLs basadas en el nombre de la ubicación
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

  // Iterar sobre las variaciones de URL
  for (String url in urlVariations) {
    final response =
        await http.head(Uri.parse(url)); // Solo obtenemos los headers

    // Verificamos si la respuesta fue exitosa
    if (response.statusCode == 200) {
      return url; // Retorna la primera URL válida
    }
  }

  // Si ninguna URL fue válida, puedes retornar una URL por defecto o null
  return null;
}

String getDecorationSlotImage(int slot) {
  if (slot == 4) {
    return 'https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/decoration_level_4_mhw_wiki.png';
  }
  return 'https://monsterhunterworld.wiki.fextralife.com/file/Monster-Hunter-World/gem_level_$slot.png';
}
