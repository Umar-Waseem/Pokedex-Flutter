import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/pokemon/pokemon.dart';

class PokemonApiHandler {
  // https://pokeapi.co/api/v2/pokemon/1/
  static const String apiUrl = "https://pokeapi.co/api/v2/pokemon/";

  // Get Pokemon Data
  static Future<Pokemon> getPokemonById(int id) async {
    final response = await http.get(Uri.parse("$apiUrl$id/"));
    log(response.body);
    try {
      return Pokemon.fromJson(response.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Pokemon> getPokemonByName(String name) async {
    final response = await http.get(Uri.parse(apiUrl + name));
    log(response.body);
    try {
      return Pokemon.fromJson(response.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
