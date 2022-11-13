import 'package:flutter/material.dart';

import '../models/pokemon/pokemon.dart';

class PokemonController with ChangeNotifier {
  List<Pokemon> allPokemons = [
    Pokemon(
      baseExperience: 142,
      height: 10,
      id: 2,
      isDefault: true,
      name: 'ivysaur',
      order: 2,
      image:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png",
      weight: 130,
      isFav: false,
    ),
  ];

  List<Pokemon> favPokemons = [];

  void toggleFavPokemon(int id) {
    final pokemon = allPokemons.firstWhere((pokemon) => pokemon.id == id);
    pokemon.isFav = !pokemon.isFav;
    if (pokemon.isFav) {
      favPokemons.add(pokemon);
    } else {
      favPokemons.remove(pokemon);
    }
    notifyListeners();
  }

  // different ways of getting

  List<Pokemon> getAllPokemons() {
    return allPokemons;
  }

  Pokemon getPokemonByIndex(int index) {
    return allPokemons[index];
  }

  // create , update, delete pokemons

  void addPokemon(Pokemon pokemon) {
    // add unique elements
    if (!allPokemons.contains(pokemon)) {
      allPokemons.add(pokemon);
      notifyListeners();
    }
  }

  void updatePokemon(int id, Pokemon pokemon) {
    allPokemons[id] = pokemon;
    notifyListeners();
  }

  void deletePokemon(int index) {
    allPokemons.removeAt(index);
    notifyListeners();
  }

  // manipulate pokemon list

  void sortPokemonList() {
    allPokemons.sort((a, b) => a.name!.compareTo(b.name!));
    notifyListeners();
  }

  void removeDuplicatesFromPokemonList() {
    allPokemons = allPokemons.toSet().toList();
    notifyListeners();
  }
}
