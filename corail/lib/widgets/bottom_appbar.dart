import 'package:corail/common/variable.dart';
import 'package:corail/pages/navigationPages/Actualit%C3%A9s.dart';
import 'package:corail/pages/navigationPages/Historique.dart';
import 'package:corail/pages/navigationPages/Home.dart';
import 'package:corail/pages/navigationPages/Statistiques.dart';
import 'package:flutter/material.dart';

class bottom_appbar extends StatelessWidget {
  const bottom_appbar({required this.page, super.key});
  final String page;
  @override
  Widget build(BuildContext context) {
    const placeholder = Opacity(
      opacity: 0,
      child: IconButton(
        icon: Icon(Icons.no_cell),
        onPressed: null,
      ),
    );
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.home,
                    color: page == 'Home' ? secondColor : Colors.black,
                  ),
                  const Text('Home'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Statistiques(),
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.list,
                    color: page == 'Statistiques' ? secondColor : Colors.black,
                  ),
                  const Text('Statistiques'),
                ],
              ),
            ),
            placeholder,
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Actualite(),
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: page == 'Actualités' ? secondColor : Colors.black,
                  ),
                  const Text('Actualités'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Historique(),
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.history,
                    color: page == 'Historique' ? secondColor : Colors.black,
                  ),
                  const Text('Historique'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
