import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          pokemon.sprites.frontDefault,
        ),
        title: Text(
          pokemon.name,
          style: const TextStyle(fontSize: 40),
        ),
        subtitle: Text(
          pokemon.types[0].type.name,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
