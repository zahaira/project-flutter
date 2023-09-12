import 'package:corail/Favori.dart';
import 'package:corail/common/variable.dart';
import 'package:corail/pages/authentification/FirstPage.dart';
import 'package:corail/pages/navigationPages/Home.dart';
import 'package:corail/pages/navigationPages/Tickets.dart';
import 'package:corail/pages/profile/Profile.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 140,
                color: mainColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
                        },
                        child: CircleAvatar(
                          radius: 48,
                          backgroundImage:
                              AssetImage('$pathImages/profile.jpg'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bonjour,',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            'Hamza',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 2,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.list,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: const Text(
                  'Général',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color.fromARGB(141, 133, 176, 196),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: const Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.analytics_outlined,
                  color: Colors.black,
                ),
                title: const Text(
                  'Mes statistiques',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.location_on,
                  color: Colors.black,
                ),
                title: const Text(
                  'Ou utilisez corail?',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onTap: () {},
              ),
              const Divider(
                color: Colors.grey,
                height: 30,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: const Text(
                  'Mes informations',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color.fromARGB(141, 133, 176, 196),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                title: const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profile()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                title: const Text(
                  'Mes favoris',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Favori()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.list,
                  color: Colors.black,
                ),
                title: const Text(
                  'Mes tickets',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Tickets()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.lock_clock,
                  color: Colors.black,
                ),
                title: const Text(
                  'Sécurité, Confidentialité',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onTap: () {},
              ),
              const Divider(
                color: Colors.grey,
                height: 30,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: const Text(
                  'Service additionels',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color.fromARGB(141, 133, 176, 196),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.local_parking,
                  color: Colors.black,
                ),
                title: const Text(
                  'Parking',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onTap: () {},
              ),
              const Divider(
                color: Colors.grey,
                height: 30,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: const Text(
                  'Avantages',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color.fromARGB(141, 133, 176, 196),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.handshake_outlined,
                  color: Colors.black,
                ),
                title: const Text(
                  'Corail challenge',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onTap: () {},
              ),
              const Divider(
                color: Colors.grey,
                height: 30,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: const Text(
                  'Parrainer et code',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color.fromARGB(141, 133, 176, 196),
                  ),
                ),
              ),
              ListTile(
                leading: Image.asset('$pathImages/heart.png'),
                title: const Text(
                  'Parrainer un ami',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Color(0xFFDC3545),
                ),
                title: const Text(
                  'Déconnexion',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFFDC3545),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FisrtPage()));
                },
              ),
              const SizedBox(
                height: 27,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
