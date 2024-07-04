import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/widgets/type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({
    super.key,
    required this.pokemon,
  });
  final Pokemon pokemon;
  // final Function(String, DetailArguments) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152,
      height: 100,
      // padding: EdgeInsets.all(16),
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: pokemon.baseColor!.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          Positioned(
            left: 90,
            top: 37,
            child: Image.asset(
              'assets/images/pokeball.png',
              color: Colors.white.withOpacity(0.3),
              width: 90,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        pokemon.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(
                      '#${pokemon.num}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pokemon.type
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: TypeWidget(
                                    name: e,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Image.network(
                      pokemon.image,
                      width: 56,
                      height: 56,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
