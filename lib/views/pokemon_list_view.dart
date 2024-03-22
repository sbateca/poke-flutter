import 'package:flutter/material.dart';
import 'package:pokemon_app/provider/pokemon_provider.dart';
import 'package:pokemon_app/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_app/widgets/pokemon_action_button.dart';

class PokemonListView extends StatefulWidget {
  const PokemonListView({super.key});

  @override
  State<PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokemonProvider>(context);
    int pokemonIdCounter = pokemonProvider.pokemonId;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon List View'),
      ),
      body: (pokemonProvider.pokemons.isEmpty)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: pokemonProvider.pokemons.length,
              itemBuilder: (context, index) {
                return PokemonCard(
                  pokemon: pokemonProvider.pokemons[index],
                );
              },
            ),
      floatingActionButton: CustomFloatingActionButton(
          icon: Icons.add,
          onPressed: () {
            pokemonProvider.addPokemon(pokemonIdCounter, 1);
            pokemonProvider.pokemonIdCounter = pokemonIdCounter + 1;
            setState(() {});
          }),
    );
  }
}

