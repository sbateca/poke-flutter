import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/services/pokemon_services.dart';

class PokemonProvider extends ChangeNotifier {
  final List<Pokemon> _pokemons = [];

  void addPokemon(id) async {
    final pokemon = await PokemonServices.getPokemon(id);

    _pokemons.add(pokemon);

    notifyListeners();
  }

  List<Pokemon> get pokemons => _pokemons;
}
