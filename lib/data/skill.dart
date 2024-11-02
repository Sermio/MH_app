class SpecificSkill {
  final int id;
  final String name;
  final String description;
  final List<Rank> ranks;

  SpecificSkill({
    required this.id,
    required this.name,
    required this.description,
    required this.ranks,
  });

  factory SpecificSkill.fromJson(Map<String, dynamic> json) {
    return SpecificSkill(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      ranks: (json['ranks'] as List)
          .map((rankJson) => Rank.fromJson(rankJson))
          .toList(),
    );
  }
}

class Rank {
  final int id;
  final int specificSkill;
  final int level;
  final Modifiers modifiers;
  final String description;
  final String specificSkillName;

  Rank({
    required this.id,
    required this.specificSkill,
    required this.level,
    required this.modifiers,
    required this.description,
    required this.specificSkillName,
  });

  factory Rank.fromJson(Map<String, dynamic> json) {
    return Rank(
      id: json['id'],
      specificSkill: json['skill'],
      level: json['level'],
      modifiers: Modifiers.fromJson(json['modifiers']),
      description: json['description'],
      specificSkillName: json['skillName'],
    );
  }
}

class Modifiers {
  final int? resistDragon;
  final int? defense;

  Modifiers({
    this.resistDragon,
    this.defense,
  });

  factory Modifiers.fromJson(Map<String, dynamic> json) {
    return Modifiers(
      resistDragon: json['resistDragon'],
      defense: json['defense'],
    );
  }
}
