import 'dart:convert';

class Pictures {
  Pictures({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });
  final String? backDefault;
  final String? backFemale;
  final String? backShiny;
  final String? backShinyFemale;
  final String? frontDefault;
  final String? frontFemale;
  final String? frontShiny;
  final String? frontShinyFemale;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'backDefault': backDefault,
      'backFemale': backFemale,
      'backShiny': backShiny,
      'backShinyFemale': backShinyFemale,
      'frontDefault': frontDefault,
      'frontFemale': frontFemale,
      'frontShiny': frontShiny,
      'frontShinyFemale': frontShinyFemale,
    };
  }

  factory Pictures.fromMap(Map<String, dynamic> map) {
    return Pictures(
      backDefault:
          map['backDefault'] != null ? map['backDefault'] as String : null,
      backFemale:
          map['backFemale'] != null ? map['backFemale'] as String : null,
      backShiny: map['backShiny'] != null ? map['backShiny'] as String : null,
      backShinyFemale: map['backShinyFemale'] != null
          ? map['backShinyFemale'] as String
          : null,
      frontDefault:
          map['frontDefault'] != null ? map['frontDefault'] as String : null,
      frontFemale:
          map['frontFemale'] != null ? map['frontFemale'] as String : null,
      frontShiny:
          map['frontShiny'] != null ? map['frontShiny'] as String : null,
      frontShinyFemale: map['frontShinyFemale'] != null
          ? map['frontShinyFemale'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pictures.fromJson(String source) =>
      Pictures.fromMap(json.decode(source) as Map<String, dynamic>);
}
