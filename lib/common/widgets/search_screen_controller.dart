// import 'package:flutter/material.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class SearchBar extends StatefulWidget {
//   const SearchBar({super.key});

//   @override
//   State<SearchBar> createState() => _SearchBarState();
// }

// class _SearchBarState extends State<SearchBar> {
//   String query = '';

//   void onQueryChanged(String newQuery) {
//     setState(() {
//       query = newQuery;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       child: TextField(
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           labelText: 'Procure um pokemon',
//           hintText: 'Digite aqui para procurar',
//           prefixIcon: Image.asset('assets/images/search.png'),
//         ),
//       ),
//     );
//   }
// }

// class _SearchScreenState extends State<SearchScreen> {
//   List<String> data = [];

//   List<String> searchResults = [];

//   void onQueryChanged(String query) {
//     setState(() {
//       searchResults = data
//           .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SearchBar(),
//           Expanded(
//             child: Center(
//               child: Text('Resultados da pesquisa:'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
