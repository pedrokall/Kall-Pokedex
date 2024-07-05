import 'package:flutter/material.dart';

class ComparatorPage extends StatefulWidget {
  const ComparatorPage({super.key});

  @override
  State<ComparatorPage> createState() => _ComparatorPageState();
}

class _ComparatorPageState extends State<ComparatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Comparador',
              style: TextStyle(
                fontSize: 36,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Selecione dois pokemons e compare eles para ver quem é o mais forte!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xffF2F4F7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Ação ao clicar no botão
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text('ADD POKEMON'),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.casino_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xffF2F4F7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Ação ao clicar no botão
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text('ADD POKEMON'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 14,
                  ),
                  minimumSize: const Size(312, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('COMPARE!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
    //   body: Container(
    //     decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //         begin: Alignment.topCenter,
    //         end: Alignment.bottomCenter,
    //         colors: [
    //           Color(0xffFF9741),
    //           Color(0xffFF9741),
    //           Colors.white,
