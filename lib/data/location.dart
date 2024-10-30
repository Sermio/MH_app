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

  // Método para deserializar un objeto JSON a una instancia de la clase Location
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

  // Método para serializar una instancia de la clase Location a un objeto JSON
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

  // Método para deserializar un objeto JSON a una instancia de la clase Camp
  factory Camp.fromJson(Map<String, dynamic> json) {
    return Camp(
      id: json['id'] as int,
      zone: json['zone'] as int,
      name: json['name'] as String,
    );
  }

  // Método para serializar una instancia de la clase Camp a un objeto JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'zone': zone,
      'name': name,
    };
  }
}
