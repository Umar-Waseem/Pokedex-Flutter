// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pokemon {
  Pokemon({
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.isDefault,
    required this.name,
    required this.order,
    required this.image,
    required this.weight,
    required this.isFav,
  });
  final int? baseExperience;
  final int? height;
  final int? id;
  final bool? isDefault;
  final String? name;
  final int? order;
  final String? image;
  final int? weight;
  bool isFav;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'baseExperience': baseExperience,
      'height': height,
      'id': id,
      'isDefault': isDefault,
      'name': name,
      'order': order,
      'pictures': image,
      'weight': weight,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      baseExperience:
          map['baseExperience'] != null ? map['baseExperience'] as int : null,
      height: map['height'] != null ? map['height'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      isDefault: map['isDefault'] != null ? map['isDefault'] as bool : null,
      name: map['name'] != null ? map['name'] as String : null,
      order: map['order'] != null ? map['order'] as int : null,
      image: getNotNullValue(map),
      weight: map['weight'] != null ? map['weight'] as int : null,
      isFav: false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source) as Map<String, dynamic>);
}

String? getNotNullValue(Map<String, dynamic> map) {
  if (map["sprites"]["front_default"] != null) {
    return map["sprites"]["front_default"];
  } else if (map["sprites"]["back_default"] != null) {
    return map["sprites"]["back_default"];
  } else if (map["sprites"]["front_shiny"] != null) {
    return map["sprites"]["front_shiny"];
  } else if (map["sprites"]["back_shiny"] != null) {
    return map["sprites"]["back_shiny"];
  } else {
    return null;
  }
}
