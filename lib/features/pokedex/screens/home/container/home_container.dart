import 'package:flutter/material.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';
// import 'package:pokedex/common/repository/poke_busca.dart';
import 'package:pokedex/common/repository/pokemon_repository.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/dashboard_page.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/home_errors.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/home_loading.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
    required this.repository,
    required this.onItemTap,
  });
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    // var pokeList = BuscaPokemonRepository
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const HomeLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return DashBoardPage(
              list: snapshot.data!, onItemtap: onItemTap,
            );
          }

          if (snapshot.hasError) {
            return HomeErrors(
              error: (snapshot.error as Failure).message!,
            );
          }

          return Container();
        });
  }
}
