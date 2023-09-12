import 'package:corail/common/variable.dart';
import 'package:corail/pages/authentification/signin/SignIn.dart';
import 'package:corail/pages/authentification/signup/QuiVous.dart';
import 'package:flutter/material.dart';

class FisrtPage extends StatelessWidget {
  const FisrtPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 112,
                child: ClipOval(
                  child: Image.asset(
                    '$pathImages/shopgirl4.jpg',
                    fit: BoxFit.cover,
                    width: 224,
                    height: 224,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 100,
                child: Column(
                  children: [
                    SizedBox(
                        width: 200, child: Image.asset('$pathImages/logo.png')),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Bienvenue sur Corail",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: mainColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Tous vos tickets, Une seule app",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: mainColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuiVous(),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 15, left: 20, right: 20),
                    child: Text(
                      "Créer un compte",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FirstSignIn(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "J'ai déjà un compte",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: mainColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
