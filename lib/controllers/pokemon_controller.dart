import 'package:flutter/material.dart';

import '../models/pokemon/pictures.dart';
import '../models/pokemon/pokemon.dart';

class PokemonController with ChangeNotifier {
  List<Pokemon> allPokemons = [
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
      isFav: false,
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
      isFav: false,
    ),
  ];

  List<Pokemon> favPokemons = [];
  
  void toggleFavPokemon(Pokemon pokemon) {
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
    allPokemons.add(pokemon);
    notifyListeners();
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
    allPokemons.sort((a, b) => a.name.compareTo(b.name));
    notifyListeners();
  }

  void removeDuplicatesFromPokemonList() {
    allPokemons = allPokemons.toSet().toList();
    notifyListeners();
  }
}
