import 'package:corail/common/variable.dart';
import 'package:corail/pages/notifications/NotificationPage.dart';
import 'package:flutter/material.dart';

class AutoriseNotification extends StatelessWidget {
  const AutoriseNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFEFEFD),
        body: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset('$pathImages/notify.png'),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              alignment: Alignment.center,
              child: const Text(
                'Autoriser les notifications',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              child: const Text(
                'Soyez alerté sur le statut de vos achats et les informations de vos commerçants favoris.',
                style: TextStyle(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: secondColor, padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    )),
                onPressed: () {
                  allowNotification = true;
                  _showBottomSheet(context);
                },
                child: const Text(
                  'Autoriser',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const SizedBox(
          height: 80,
          child: Center(
            child: Text('Notification activée avec succès!'),
          ),
        );
      },
    ).then((value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NotificationPage(),
        )));
  }
}
