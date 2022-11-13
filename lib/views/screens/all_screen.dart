import 'package:flutter/material.dart';
import 'package:pokedex/controllers/pokemon_controller.dart';
import 'package:provider/provider.dart';

import '../../widgets/pokemon_card.dart';

class AllScreen extends StatelessWidget {
  const AllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonController>(
      builder: (ctxt, data, child) => Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'All Pokemons',
              style: Theme.of(context).textTheme.headline3,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: data.getAllPokemons().length,
                itemBuilder: (context, index) {
                  return PokemonCard(
                    name: data.getAllPokemons()[index].name!,
                    level:
                        data.getAllPokemons()[index].baseExperience.toString(),
                    image: data.getAllPokemons()[index].image!,
                    isFav: data.getAllPokemons()[index].isFav,
                    id: data.getAllPokemons()[index].id!,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
