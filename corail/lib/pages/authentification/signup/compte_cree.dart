import 'package:corail/common/variable.dart';
import 'package:corail/pages/navigationPages/home.dart';
import 'package:flutter/material.dart';

class CompteCree extends StatelessWidget {
  const CompteCree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 70,
            ),
            CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              radius: 50,
              child: Icon(
                Icons.check_rounded,
                size: 70,
                color: mainColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                'Votre compte a bien été cree !!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Plus qu’a ajouter vos tickets ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: mainColor,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    )),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => Home())));
                },
                child: const Text('CONTINUER'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      
    );
  }
}
