class Monster {
  final int id;
  final String name;
  final String type;
  final String species;
  final String description;
  final List<Location> location;
  final List<Weakness> weaknesses;
  final List<Reward> rewards;

  Monster({
    required this.id,
    required this.name,
    required this.type,
    required this.species,
    required this.description,
    required this.location,
    required this.weaknesses,
    required this.rewards,
  });

  factory Monster.fromJson(Map<String, dynamic> json) {
    return Monster(
      id: json['id'],
      name: json['name'] ?? "Unknown Monster",
      type: json['type'] ?? "Unknown Type",
      species: json['species'] ?? "Unknown Species",
      description: json['description'] ?? "No description available",
      location: (json['locations'] as List<dynamic>?)
              ?.map((locationJson) => Location.fromJson(locationJson))
              .toList() ??
          [],
      weaknesses: (json['weaknesses'] as List<dynamic>?)
              ?.map((weaknessJson) => Weakness.fromJson(weaknessJson))
              .toList() ??
          [],
      rewards: (json['rewards'] as List<dynamic>?)
              ?.map((rewardJson) => Reward.fromJson(rewardJson))
              .toList() ??
          [],
    );
  }
}

class Weakness {
  final String element;
  final int stars;
  final String? condition;

  Weakness({
    required this.element,
    required this.stars,
    this.condition,
  });

  factory Weakness.fromJson(Map<String, dynamic> json) {
    return Weakness(
      element: json['element'],
      stars: json['stars'],
      condition: json['condition'],
    );
  }
}

class Location {
  final int id;
  final int zoneCount;
  final String? name;

  Location({
    required this.id,
    required this.zoneCount,
    this.name,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      zoneCount: json['zoneCount'] ?? "Unknown zoneCount",
      name: json['name'] ?? "Unknown Location",
    );
  }
}

class Reward {
  final int id;
  final Item item;
  final List<Condition> conditions;

  Reward({
    required this.id,
    required this.item,
    required this.conditions,
  });

  factory Reward.fromJson(Map<String, dynamic> json) {
    return Reward(
      id: json['id'],
      item: Item.fromJson(json['item']),
      conditions: (json['conditions'] as List<dynamic>)
          .map((conditionJson) => Condition.fromJson(conditionJson))
          .toList(),
    );
  }
}

class Item {
  final int id;
  final String name;
  final String description;
  final int rarity;
  final int carryLimit;
  final int value;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.rarity,
    required this.carryLimit,
    required this.value,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      rarity: json['rarity'],
      carryLimit: json['carryLimit'],
      value: json['value'],
    );
  }
}

class Condition {
  final String type;
  final String? subtype;
  final String rank;
  final int quantity;
  final int chance;

  Condition({
    required this.type,
    this.subtype,
    required this.rank,
    required this.quantity,
    required this.chance,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      type: json['type'],
      subtype: json['subtype'],
      rank: json['rank'],
      quantity: json['quantity'],
      chance: json['chance'],
    );
  }
}
