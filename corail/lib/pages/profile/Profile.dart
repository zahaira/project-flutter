import 'dart:io';

import 'package:corail/common/variable.dart';
import 'package:corail/pages/authentification/FirstPage.dart';
import 'package:corail/pages/notifications/AutoriseNotification.dart';
import 'package:corail/pages/notifications/NotificationPage.dart';
import 'package:corail/pages/profile/edit/EditProfileCodePostale.dart';
import 'package:corail/pages/profile/edit/EditProfileEmail.dart';
import 'package:corail/pages/profile/edit/EditProfileName.dart';
import 'package:corail/pages/profile/edit/EditProfilePhone.dart';
import 'package:corail/widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final double coverHeight = 100;
  final double profileHeight = 100;
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;

    return SafeArea(
      child: Scaffold(
        drawer: const DrawerWidget(),
        key: scaffoldKey,
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: bottom),
                  child: buildCover(),
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    child: const ClipOval(
                      child: Icon(
                        Icons.list,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: top,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      _selectedImage != null
                          ? ClipOval(
                              child: SizedBox(
                                width: profileHeight,
                                height: profileHeight,
                                child: Image.file(
                                  _selectedImage!,
                                  fit: BoxFit
                                      .cover, // You can adjust the fit mode as needed
                                ),
                              ),
                            )
                          : buildProfileImage(),
                      Positioned(
                        top: 13,
                        left: 74,
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet()),
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.camera_alt,
                              color: mainColor,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 26,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      if (allowNotification == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationPage(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AutoriseNotification(),
                          ),
                        );
                      }
                    },
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Hamza',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Identité'),
                trailing: const Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileName(),
                    ),
                  );
                },
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                leading: const Icon(Icons.email),
                title: const Text('hamzariyani@gmail.com'),
                trailing: const Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileEmail(),
                    ),
                  );
                },
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('+2126-4898-5541'),
                trailing: const Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfilePhone(),
                    ),
                  );
                },
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Adresse postale'),
                trailing: const Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileCodePostale(),
                    ),
                  );
                },
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Color(0xFFDC3545),
                ),
                title: const Text(
                  'Déconnexion',
                  style: TextStyle(
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCover() => Container(
        color: mainColor,
        width: double.infinity,
        height: coverHeight,
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey,
        backgroundImage: AssetImage('$pathImages/profile.jpg'),
      );

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text(
            "Choisir une photo de profile",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.1),
                    elevation: 0,
                    foregroundColor: mainColor,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("Camera")),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.1),
                    elevation: 0,
                    foregroundColor: mainColor,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.image),
                  label: const Text("Galerie")),
            ],
          ),
        ],
      ),
    );
  }
}
