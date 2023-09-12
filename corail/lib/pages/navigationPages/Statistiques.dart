import 'package:corail/common/variable.dart';
import 'package:corail/pages/ScanQr.dart';
import 'package:corail/widgets/bottom_appbar.dart';
import 'package:corail/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';

class Statistiques extends StatelessWidget {
  const Statistiques({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScanQr(),
            ),
          );
        },
        backgroundColor: mainColor,
        child: Image.asset('$pathImages/scan.png'),
        splashColor: secondColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const bottom_appbar(page: 'Statistiques'),
      drawerScrimColor: Colors.transparent,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: Text('Statistiques'),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
    );
  }
}
