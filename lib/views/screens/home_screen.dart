import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pokedex/helpers/api_handler.dart';
import 'package:pokedex/widgets/pokemon_card.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _iDController = TextEditingController();

  Future<Pokemon>? newPokemon;

  @override
  void initState() {
    _nameController.addListener(() {
      setState(() {});
    });
    _iDController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonController>(
      builder: (context, pokemonController, child) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Search And Add A Pokemon',
                  style: Theme.of(context).textTheme.headline3,
                ),
                FormBuilderTextField(
                  controller: _iDController,
                  name: 'ID',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: "ID is required"),
                    FormBuilderValidators.numeric(
                      errorText: "ID must be numeric",
                    ),
                  ]),
                  decoration:
                      const InputDecoration(labelText: 'Search Pokemon By ID'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _iDController.text.isNotEmpty
                      ? () {
                          setState(() {
                            newPokemon = PokemonApiHandler.getPokemonById(
                              int.parse(_iDController.text),
                            ).then((value) {
                              pokemonController.addPokemon(value);
                              return value;
                            });
                          });
                        }
                      : null,
                  child: const Text('Add'),
                ),
                FormBuilderTextField(
                  controller: _nameController,
                  name: 'Name',
                  decoration: const InputDecoration(
                      labelText: 'Search Pokemon By Name'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: "Name is required"),
                    FormBuilderValidators.minLength(3,
                        errorText: "Name must be at least 3 characters"),
                  ]),
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  // enable the button if the form is valid
                  onPressed: _nameController.text.isNotEmpty
                      ? () {
                          setState(() {
                            newPokemon = PokemonApiHandler.getPokemonByName(
                              _nameController.text,
                            ).then((value) {
                              pokemonController.addPokemon(value);
                              return value;
                            });
                          });
                        }
                      : null,
                  child: const Text('Add'),
                ),
                if (newPokemon != null)
                  FutureBuilder<Pokemon>(
                    future: newPokemon,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return PokemonCard(
                          name: snapshot.data!.name!,
                          image: snapshot.data!.image!,
                          level: snapshot.data!.baseExperience.toString(),
                          isFav: snapshot.data!.isFav,
                          id: snapshot.data!.id!,
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
