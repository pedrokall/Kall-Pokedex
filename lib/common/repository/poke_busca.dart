// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:pokedex/common/consts/api_consts.dart';
// import 'package:pokedex/common/error/failure.dart';
// import 'package:pokedex/common/models/pokemon.dart';

// abstract class BuscaPokemonRepository {
//   Future<List<dynamic>> getPokemonList();
// }

// class PokemonBuscaRepository implements BuscaPokemonRepository {
//   final Dio dio;

//   PokemonBuscaRepository({required this.dio});
//   @override
//   Future<List<dynamic>> getPokemonList() async {
//     try {
//       final response = await dio.get(ApiConsts.allPokemonsURL);
//       final json = jsonDecode(response.data) as Map<String, dynamic>;
//       final list = json['pokemon'] as List<dynamic>;
//       return list;
//     } catch (e) {
//       throw Failure(message: 'Impossível carregar dados');
//     }
//   }
// }
