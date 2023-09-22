import 'package:corail/common/variable.dart';
import 'package:corail/pages/ScanQr.dart';
import 'package:corail/pages/notifications/AutoriseNotification.dart';
import 'package:corail/pages/notifications/NotificationPage.dart';
import 'package:corail/widgets/BrandList.dart';
import 'package:corail/widgets/PubSection.dart';
import 'package:corail/widgets/bottom_appbar.dart';
import 'package:corail/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        drawerScrimColor: Colors.transparent,
        drawer: const DrawerWidget(),
        key: scaffoldKey,
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
        bottomNavigationBar: const bottom_appbar(page: 'Home'),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                            child: ClipOval(
                              child: Image.asset(
                                '$pathImages/profile.jpg', // Replace with your image asset path
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover, // Adjust the fit as needed
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Column(
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
                          child: GestureDetector(
                            onTap: () {
                              if (allowNotification == true) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationPage(),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AutoriseNotification(),
                                  ),
                                );
                              }
                            },
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      PubSection(images: PubImages),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TitleSection(
                            title: 'Vêtements',
                          ),
                          GestureDetector(
                            onTap: () {
                             
                            },
                            child: Container(
                              padding: const EdgeInsets.only(right: 20),
                              child: const Text(
                                'Voir plus',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BrandList(category: 'Vêtements'),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TitleSection(
                            title: 'Beauté',
                          ),
                          GestureDetector(
                            onTap: () {
                              
                            },
                            child: Container(
                              padding: const EdgeInsets.only(right: 20),
                              child: const Text(
                                'Voir plus',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BrandList(category: 'Beauté'),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TitleSection(
                            title: 'Alimentation',
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => SafeArea(
                              //                 child: Scaffold(
                              //               body: BrandList(
                              //                   category: 'Alimentation'),
                              //             ))));
                            },
                            child: Container(
                              padding: const EdgeInsets.only(right: 20),
                              child: const Text(
                                'Voir plus',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BrandList(category: 'Alimentation'),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TitleSection(
                            title: 'Mobilier et ameublement',
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => SafeArea(
                              //                 child: Scaffold(
                              //               body: BrandList(
                              //                   category:
                              //                       'Mobilier et ameublement'),
                              //             ))));
                            },
                            child: Container(
                              padding: const EdgeInsets.only(right: 20),
                              child: const Text(
                                'Voir plus',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BrandList(category: 'Mobilier et ameublement'),
                      const SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    required this.title,
    super.key,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 19, fontWeight: FontWeight.w700, color: mainColor),
      ),
    );
  }
}
