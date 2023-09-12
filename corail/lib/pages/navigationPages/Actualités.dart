import 'package:corail/common/variable.dart';
import 'package:corail/pages/ScanQr.dart';
import 'package:corail/widgets/bottom_appbar.dart';
import 'package:corail/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';

class Actualite extends StatefulWidget {
  const Actualite({super.key});

  @override
  State<Actualite> createState() => _ActualiteState();
}

class _ActualiteState extends State<Actualite> {
  List<bool> followStatusList = List.filled(tickets.length, false);
  List ticketList = [];
  @override
  void initState() {
    Set<String> uniqueBrands = Set();
    ticketList = tickets.where((element) {
      if (!uniqueBrands.contains(element.brand)) {
        uniqueBrands.add(element.brand);
        return true;
      }
      return false;
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const bottom_appbar(page: 'Actualités'),
      extendBody: true,
      drawerScrimColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScanQr(),
            ),
          );
        },
        backgroundColor: mainColor,
        splashColor: secondColor,
        child: Image.asset('$pathImages/scan.png'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('Actualités'),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 20,
          ),
          for (int i = 0; i < ticketList.length; i++)
            brandCard(ticketList[i], i),
          const SizedBox(
            height: 22,
          ),
        ],
      ),
    );
  }

  Widget brandCard(Ticket brand, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        child: ListTile(
          leading: SizedBox(
            width: 80,
            child: Image.asset("$pathImages/${brand.logo}"),
          ),
          title: Text(brand.brand),
          trailing: ElevatedButton(
            onPressed: () {
              setState(() {
                followStatusList[index] = !followStatusList[index];
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.2),
              elevation: 0,
            ),
            child: Text(
              followStatusList[index] ? 'Suivi' : 'Suivre +',
              style: TextStyle(
                fontSize: 15,
                color: followStatusList[index] ? secondColor : mainColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
