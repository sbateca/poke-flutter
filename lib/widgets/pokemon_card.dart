import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/utils/utils.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: const EdgeInsets.all(8),
        child: ListTile(
          leading: Image.network(
            pokemon.sprites.frontDefault,
            scale: 1.5,
          ),
          title: Text(
            capitalize(pokemon.name),
            style: const TextStyle(fontSize: 40),
          ),
          subtitle: Text(
            capitalize(pokemon.types[0].type.name),
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, "/details", arguments: pokemon);
      },
    );
  }
}


class PokemonGridCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonGridCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: const EdgeInsets.all(8),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            double cardWidth = constraints.maxWidth;
            double imageHeight = cardWidth * 0.55;
            return Column(
              children: [
                Image.network(
                  pokemon.sprites.frontDefault,
                  height: imageHeight,
                  fit: BoxFit.contain,
                ),
                ListTile(
                  title: Text(
                    capitalize(pokemon.name),
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    capitalize(pokemon.types[0].type.name),
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, "/details", arguments: pokemon);
      },
    );
  }
}
