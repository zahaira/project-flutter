import 'package:corail/common/variable.dart';
import 'package:corail/pages/ScanQr.dart';
import 'package:corail/widgets/bottom_appbar.dart';
import 'package:corail/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';

class Historique extends StatelessWidget {
  const Historique({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const bottom_appbar(page: 'Historique'),
        extendBody: true,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const ScanQr(),
            //   ),
            // );
          },
          backgroundColor: mainColor,
          splashColor: secondColor,
          child: Image.asset('$pathImages/scan.png'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        drawerScrimColor: Colors.transparent,
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title: const Text('Historique'),
          centerTitle: true,
          backgroundColor: mainColor,
        ),
      
    );
  }
}
