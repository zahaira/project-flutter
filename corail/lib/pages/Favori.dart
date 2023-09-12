import 'package:corail/common/variable.dart';
import 'package:flutter/material.dart';

class Favori extends StatefulWidget {
  const Favori({super.key});

  @override
  State<Favori> createState() => _FavoriState();
}

class _FavoriState extends State<Favori> {
  bool favori2 = true;
  bool favori3 = true;
  bool favori4 = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mes favoris'),
          centerTitle: true,
          backgroundColor: mainColor,
        ),
        body: ListView(children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
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
                    child: Image.asset('$pathImages/rocher.png')),
              ),
              title: const Text(
                  "Vous avez achetez de chez Yves Rocher un montant de 500,00 dh"),
              trailing: IconButton(
                icon: favori2 == true
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red[600],
                      )
                    : const Icon(Icons.favorite_border),
                onPressed: () {
                  setState(() {
                    favori2 = !favori2;
                  });
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
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
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
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
                    child: Image.asset('$pathImages/marjane.png')),
              ),
              title: const Text(
                  "Vous avez achetez de chez ETAM un montant de 258,00 dh"),
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
        ]),
      ),
    );
  }
}
