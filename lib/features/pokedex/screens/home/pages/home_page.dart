import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/card_detail.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/widgets/pokemon_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.list,
    required this.onItemtap,
  });

  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemtap;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pokemon> myPokelist = [];
  String buscaNome = '';
  List<Widget> pokemonWidgets = [];

  Widget? selectedPokemon;

  _showRandomPokemon() {
    final random = Random();
    setState(() {
      selectedPokemon = pokemonWidgets[random.nextInt(pokemonWidgets.length)];
    });
  }

  randomButton() {}

  buscaPoke(String busca) {
    myPokelist = widget.list
        .where((pokemon) =>
            pokemon.name.toLowerCase().contains(busca.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'KallDex',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 36,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                'Use a busca avançada de Pokémon por tipo, fraqueza, habilidade e mais!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                onChanged: (busca) {
                  setState(() {
                    buscaNome = busca;
                  });
                  buscaPoke(buscaNome);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  labelText: 'Procure um pokemon',
                  hintText: 'Digite aqui para procurar',
                  prefixIcon: Image.asset('assets/images/search.png'),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: myPokelist.isNotEmpty || buscaNome.isNotEmpty
                      ? myPokelist.length
                      : widget.list.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CardDetail(
                                      pokemon: myPokelist.isNotEmpty
                                          ? myPokelist[index]
                                          : widget.list[index],
                                    )));
                      },
                      child: PokemonItemWidget(
                        pokemon: myPokelist.isNotEmpty
                            ? myPokelist[index]
                            : widget.list[index],
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 120,
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                ),
              ),
              selectedPokemon ?? const Text(''),
              const SizedBox(height: 5),
              const SizedBox(height: 10),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Image.asset('assets/images/magic_button.png'),
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
          onPressed: _showRandomPokemon,
          label: const Text('Random'),
        ),
      ),
    );
  }
}
