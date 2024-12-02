class Location {
  final int id;
  final int zoneCount;
  final String name;
  final List<Camp> camps;

  Location({
    required this.id,
    required this.zoneCount,
    required this.name,
    required this.camps,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'] as int,
      zoneCount: json['zoneCount'] as int,
      name: json['name'] as String,
      camps: (json['camps'] as List<dynamic>)
          .map((camp) => Camp.fromJson(camp as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'zoneCount': zoneCount,
      'name': name,
      'camps': camps.map((camp) => camp.toJson()).toList(),
    };
  }
}

class Camp {
  final int id;
  final int zone;
  final String name;

  Camp({
    required this.id,
    required this.zone,
    required this.name,
  });

  factory Camp.fromJson(Map<String, dynamic> json) {
    return Camp(
      id: json['id'] as int,
      zone: json['zone'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'zone': zone,
      'name': name,
    };
  }
}
