import 'package:flutter/material.dart';

import '../models/pokemon/pictures.dart';
import '../models/pokemon/pokemon.dart';

class PokemonController with ChangeNotifier {
  List<Pokemon> pokemons = [
    Pokemon(
      baseExperience: 64,
      height: 7,
      id: 1,
      isDefault: true,
      name: 'bulbasaur',
      order: 1,
      pictures: Pictures(
        frontDefault:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
        frontShiny:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png',
        frontFemale: null,
        frontShinyFemale: null,
        backDefault:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png',
        backShiny:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png',
        backFemale: null,
        backShinyFemale: null,
      ),
      weight: 69,
    ),
    Pokemon(
      baseExperience: 142,
      height: 10,
      id: 2,
      isDefault: true,
      name: 'ivysaur',
      order: 2,
      pictures: Pictures(
        frontDefault:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png',
        frontShiny:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/2.png',
        frontFemale: null,
        frontShinyFemale: null,
        backDefault:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/2.png',
        backShiny:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/2.png',
        backFemale: null,
        backShinyFemale: null,
      ),
      weight: 130,
    ),
  ];

  // different ways of getting

  List<Pokemon> getPokemons() {
    return pokemons;
  }

  Pokemon getPokemonByIndex(int index) {
    return pokemons[index];
  }

  // create , update, delete pokemons

  void addPokemon(Pokemon pokemon) {
    pokemons.add(pokemon);
    notifyListeners();
  }

  void updatePokemon(int id, Pokemon pokemon) {
    pokemons[id] = pokemon;
    notifyListeners();
  }

  void deletePokemon(int index) {
    pokemons.removeAt(index);
    notifyListeners();
  }

  // manipulate pokemon list

  void sortPokemonList() {
    pokemons.sort((a, b) => a.name.compareTo(b.name));
    notifyListeners();
  }

  void removeDuplicatesFromPokemonList() {
    pokemons = pokemons.toSet().toList();
    notifyListeners();
  }
}
