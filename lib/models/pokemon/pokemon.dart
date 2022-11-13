import 'dart:convert';

import 'pictures.dart';

class Pokemon {
  Pokemon({
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.isDefault,
    required this.name,
    required this.order,
    required this.pictures,
    required this.weight,
  });
  final int baseExperience;
  final int height;
  final int id;
  final bool isDefault;
  final String name;
  final int order;
  final Pictures pictures;
  final int weight;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'baseExperience': baseExperience,
      'height': height,
      'id': id,
      'isDefault': isDefault,
      'name': name,
      'order': order,
      'pictures': pictures.toMap(),
      'weight': weight,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      baseExperience: map['baseExperience'] as int,
      height: map['height'] as int,
      id: map['id'] as int,
      isDefault: map['isDefault'] as bool,
      name: map['name'] as String,
      order: map['order'] as int,
      pictures: Pictures.fromMap(map['pictures'] as Map<String, dynamic>),
      weight: map['weight'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source) as Map<String, dynamic>);
}
