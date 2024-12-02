class ItemDecoration {
  final int id;
  final int rarity;
  final int slot;
  final String name;
  final List<Skill> skills;

  ItemDecoration({
    required this.id,
    required this.rarity,
    required this.slot,
    required this.name,
    required this.skills,
  });

  factory ItemDecoration.fromJson(Map<String, dynamic> json) {
    return ItemDecoration(
      id: json['id'],
      rarity: json['rarity'],
      slot: json['slot'],
      name: json['name'] ?? "Unknown Item Decoration",
      skills: (json['skills'] as List<dynamic>?)
              ?.map((skillJson) => Skill.fromJson(skillJson))
              .toList() ??
          [],
    );
  }
}

class Skill {
  final int id;
  final int level;
  final Map<String, dynamic> modifiers;
  final String description;
  final int skillId;
  final String skillName;

  Skill({
    required this.id,
    required this.level,
    required this.modifiers,
    required this.description,
    required this.skillId,
    required this.skillName,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json['id'],
      level: json['level'],
      modifiers: json['modifiers'] ?? {},
      description: json['description'] ?? "No description available",
      skillId: json['skill'], // Guardamos 'skill' en 'skillId'
      skillName: json['skillName'] ?? "Unknown Skill",
    );
  }
}
