import 'package:corail/common/variable.dart';
import 'package:corail/pages/notifications/NotificationPage.dart';
import 'package:flutter/material.dart';

class AutoriseNotification extends StatelessWidget {
  const AutoriseNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFEFEFD),
        body: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              child: Image.asset('$pathImages/notify.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              alignment: Alignment.center,
              child: Text(
                'Autoriser les notifications',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              child: Text(
                'Soyez alerté sur le statut de vos achats et les informations de vos commerçants favoris.',
                style: TextStyle(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    primary: secondColor,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    )),
                onPressed: () {
                  allowNotification = true;
                  _showBottomSheet(context);
                },
                child: Text(
                  'Autoriser',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 80,
          child: Center(
            child: Text('Notification activée avec succès!'),
          ),
        );
      },
    );

    // Close the bottom sheet after 3 seconds
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotificationPage(),
          ));
    });
  }
}
