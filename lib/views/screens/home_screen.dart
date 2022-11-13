import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pokedex/helpers/api_handler.dart';
import 'package:provider/provider.dart';

import '../../controllers/pokemon_controller.dart';
import '../../models/pokemon/pokemon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonController>(
      builder: (context, pokemonController, child) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _fbKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'ID',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: "ID is required"),
                  FormBuilderValidators.numeric(
                      errorText: "ID must be numeric"),
                ]),
                decoration:
                    const InputDecoration(labelText: 'Search Pokemon By ID'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _fbKey.currentState?.saveAndValidate() == true
                    ? () {
                        Future<Pokemon> newPokemon =
                            PokemonApiHandler.getPokemonById(
                                _fbKey.currentState?.value['ID']);
                        newPokemon.then((value) {
                          pokemonController.addPokemon(value);
                        });
                      }
                    : null,
                child: const Text('Search'),
              ),
              FormBuilderTextField(
                name: 'Name',
                decoration:
                    const InputDecoration(labelText: 'Search Pokemon By Name'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: "Name is required"),
                  FormBuilderValidators.minLength(3,
                      errorText: "Name must be at least 3 characters"),
                ]),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                // enable the button if the form is valid
                onPressed: _fbKey.currentState?.saveAndValidate() == true
                    ? () {
                        Future<Pokemon> newPokemon =
                            PokemonApiHandler.getPokemonByName(
                                _fbKey.currentState?.value['Name']);
                        newPokemon.then((value) {
                          pokemonController.addPokemon(value);
                        });
                      }
                    : null,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
