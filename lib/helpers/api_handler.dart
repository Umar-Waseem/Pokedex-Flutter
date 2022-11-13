import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/pokemon/pokemon.dart';

class PokemonApiHandler {
  // https://pokeapi.co/api/v2/pokemon/1/
  static const String apiUrl = "https://pokeapi.co/api/v2/pokemon/";

  // Get Pokemon Data
  static Future<Pokemon> getPokemonById(int id) async {
    final response = await http.get(Uri.parse(apiUrl + id.toString()));
    if (response.statusCode == 200) {
      return Pokemon.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }

  static Future<Pokemon> getPokemonByName(String name) async {
    final response = await http.get(Uri.parse(apiUrl + name));
    if (response.statusCode == 200) {
      return Pokemon.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }
}
