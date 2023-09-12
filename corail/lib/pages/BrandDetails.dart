import 'package:corail/common/variable.dart';
import 'package:corail/widgets/DrawerWidget.dart';
import 'package:corail/widgets/PubSection.dart';
import 'package:corail/widgets/TicketsListWidget.dart';
import 'package:flutter/material.dart';

class BrandDetails extends StatefulWidget {
  const BrandDetails({required this.brand, required this.logo, super.key});
  final String brand;
  final String logo;

  @override
  State<BrandDetails> createState() => _BrandDetailsState();
}

class _BrandDetailsState extends State<BrandDetails> {
  List zaraTickets = [];
  bool favori3 = false;
  bool favori4 = false;
  @override
  void initState() {
    zaraTickets = tickets
        .where((element) => element.brand.contains(widget.brand))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          toolbarHeight: 65,
          iconTheme: const IconThemeData(color: Colors.black),
          title: SizedBox(
            height: 50,
            width: 150,
            child: Image.asset(widget.logo),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: PubSection(images: zaraPubImages),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Mes tickets de ${widget.brand}',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: mainColor),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TicketsListWidget(ticketsList: zaraTickets),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Actualités de ${widget.brand}',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: mainColor),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: mainColor, // Set the border color
                        width: 2.0, // Set the border width
                      ),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey.shade200,
                        child: Container(
                            padding: const EdgeInsets.all(2),
                            child: const Text(
                              '1.2.3',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ),
                      title: const Text(
                          "Du 23 janvier au 16 avril 2023, Place de shop vous offre -50%"),
                      trailing: IconButton(
                        icon: favori3 == true
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red[600],
                              )
                            : const Icon(Icons.favorite_border),
                        onPressed: () {
                          setState(() {
                            favori3 = !favori3;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: mainColor, // Set the border color
                        width: 2.0, // Set the border width
                      ),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey.shade200,
                        child: Container(
                            padding: const EdgeInsets.all(2),
                            child: const Text(
                              '1.2.3',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ),
                      title: const Text(
                          "Du 23 janvier au 16 avril 2023, Place de shop vous offre -50%"),
                      trailing: IconButton(
                        icon: favori4 == true
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red[600],
                              )
                            : const Icon(Icons.favorite_border),
                        onPressed: () {
                          setState(() {
                            favori4 = !favori4;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
