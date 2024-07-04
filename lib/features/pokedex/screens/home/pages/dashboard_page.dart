import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/comparator/comparator_page.dart';
import 'package:pokedex/features/pokedex/screens/favorites/favorite_page.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/home_page.dart';
import 'package:pokedex/features/pokedex/screens/quiz/quiz_page.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key, required this.list});

  final List<Pokemon> list;

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  // PageController controller = PageController(initialPage: );
  int _currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {

    List<Widget> pagesAvaliable = [
      HomePage(list: widget.list),
      const ComparatorPage(),
      const QuizPage(),
      const FavoritePage(),
    ];

    return Scaffold(
      
      body: pagesAvaliable[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          iconSize: 18,
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
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      
    );
  }
}
