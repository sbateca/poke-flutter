import 'package:flutter/material.dart';
import 'package:pokemon_app/provider/pokemon_provider.dart';
import 'package:pokemon_app/views/pokemon_list_view.dart';
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
      home: const PokemonListView(),
    );
  }
}
