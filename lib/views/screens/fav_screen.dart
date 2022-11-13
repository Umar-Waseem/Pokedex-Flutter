import 'package:flutter/material.dart';
import 'package:pokedex/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';

import '../../controllers/pokemon_controller.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonController>(builder: (context, data, child) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Favourite Pokemons',
              style: Theme.of(context).textTheme.headline3,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: data.favPokemons.length,
              itemBuilder: (context, index) {
                return PokemonCard(
                  name: data.favPokemons[index].name!,
                  image: data.favPokemons[index].image!,
                  level: data.favPokemons[index].baseExperience.toString(),
                  isFav: data.favPokemons[index].isFav,
                  id: data.favPokemons[index].id!,
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
