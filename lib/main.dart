import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/provider/pokemon_provider.dart';
import 'package:pokemon_app/views/views.dart';
import 'package:provider/provider.dart';
// import 'package:pokemon_app/views/counter_view.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PokemonProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      initialRoute: "/splashScreen",
      routes: {
        "/splashScreen": (context) => const SplashScreen(),
        "/home": (context) => const PokemonGridView(),
        "/detailsView": (context) => const PokemonDetailsView(),
        "/category": (context) {
          final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          final Pokemon pokemon = arguments["pokemon"] as Pokemon;
          final String category = arguments["category"] as String;
          return Category(pokemon: pokemon, category: category);
        },
      },
    );
  }
}
