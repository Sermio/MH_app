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
    // Añade más variaciones según sea necesario
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
