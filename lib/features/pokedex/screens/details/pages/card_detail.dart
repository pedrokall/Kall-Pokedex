import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class CardDetail extends StatelessWidget {
  const CardDetail({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pokemon.baseColor!,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              pokemon.baseColor!,
              pokemon.baseColor!,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
              '#${pokemon.num.toString()}',
              style: const TextStyle(fontSize: 22),
            ),
            Expanded(
              flex: 1,
              child: Image.network(
                pokemon.image, // Imagem de exemplo
                fit: BoxFit.fill,
              ),
            ),
            Text(
              pokemon.name,
              style: const TextStyle(fontSize: 28),
            ),
            const Expanded(
              flex: 3,
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      tabs: [
                        Tab(text: 'Sobre'),
                        Tab(text: 'Status'),
                        Tab(text: 'Moves'),
                        Tab(text: 'Evolutions')
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Center(),
                          Stats(),
                          MovesView(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  final Map<String, int> stats = {};

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: stats.keys.map((key) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(flex: 2, child: Text(key)),
              Expanded(
                flex: 5,
                child: LinearProgressIndicator(
                  value: stats[key]! / 150.0,
                  backgroundColor: Colors.grey[300],
                  color: Colors.amber,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(stats[key].toString()),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class MovesView extends StatefulWidget {
  const MovesView({super.key});

  @override
  State<MovesView> createState() => _MovesViewState();
}

class _MovesViewState extends State<MovesView> {
  final List<String> moves = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: moves.map((move) {
        return ListTile(
          title: Text(move),
        );
      }).toList(),
    );
  }
}
