import 'package:flutter/material.dart';
import 'package:pokedex/controllers/pokemon_controller.dart';
import 'package:provider/provider.dart';

import 'views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PokemonController(),
        ),
      ],
      child: MaterialApp(
        title: 'Pokedex',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
