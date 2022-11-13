import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/pokemon_controller.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({
    super.key,
    required this.name,
    required this.image,
    required this.level,
    required this.isFav,
    required this.id,
  });

  final String name;
  final String image;
  final String level;
  final bool isFav;
  final int id;

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonController>(
      builder: (context, data, child) => Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            if (widget.image.isNotEmpty)
              Image.network(widget.image, fit: BoxFit.fill),
            const SizedBox(height: 10),
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.level,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            IconButton(
              onPressed: () {
                setState(() {
                  data.toggleFavPokemon(widget.id);
                });
              },
              icon: widget.isFav
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
