import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/widgets/pokemon_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.list,
    required this.onItemTap,
  });

  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pokemon> myPokelist = [];

  buscaPoke(String busca) {
    print(busca);
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
          title: Text(
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
              SizedBox(
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
              SizedBox(
                height: 16,
              ),
              TextField(
                onChanged: (busca) {
                  buscaPoke(busca);
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
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: myPokelist.isNotEmpty
                      ? myPokelist.length
                      : widget.list.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) {
                    return PokemonItemWidget(
                        pokemon: myPokelist.isNotEmpty
                            ? myPokelist[index]
                            : widget.list[index]);
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 120,
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.red,
          unselectedFontSize: 14,
          unselectedLabelStyle: TextStyle(
            color: Colors.red,
          ),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                  color: Colors.black,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.compare_arrows,
                  color: Colors.black,
                ),
                label: "Comparator"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.quiz_outlined,
                  color: Colors.black,
                ),
                label: 'Quiz'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
                label: "Favorites"),
          ],
        ),
      ),
    );
  }
}
