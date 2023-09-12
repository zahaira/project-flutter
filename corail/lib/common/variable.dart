import 'package:flutter/material.dart';

Color mainColor = const Color(0xFF00587A);
Color secondColor = Colors.deepPurple;
String pathImages = 'assets';

class Ticket {
  String brand;
  String category;
  String logo;
  String date;
  double price;
  Ticket({
    required this.brand,
    required this.date,
    required this.category,
    required this.logo,
    required this.price,
  });
}

List<Ticket> tickets = [
  Ticket(
    brand: "Zara",
    category: "Vêtements",
    logo: "zara.png",
    date: "02-10-23 à 15:45",
    price: 120.0,
  ),
  Ticket(
    brand: "Marjane",
    category: "Alimentation",
    logo: "marjane.png",
    date: "05-11-23 à 09:30",
    price: 250.0,
  ),
  Ticket(
    brand: "Etam",
    category: "Vêtements",
    logo: "etam.png",
    date: "10-09-23 à 14:15",
    price: 140.0,
  ),
  Ticket(
    brand: "Carrfour",
    category: "Alimentation",
    logo: "carrfour.png",
    date: "12-08-23 à 17:30",
    price: 120.0,
  ),
  Ticket(
    brand: "Zara",
    category: "Vêtements",
    logo: "zara.png",
    date: "21-07-23 à 11:20",
    price: 120.0,
  ),
  Ticket(
    brand: "LC Waikiki",
    category: "Vêtements",
    logo: "lcw.png",
    date: "04-06-23 à 08:45",
    price: 80.0,
  ),
  Ticket(
    brand: "Zara",
    category: "Vêtements",
    logo: "zara.png",
    date: "15-05-23 à 16:10",
    price: 120.0,
  ),
  Ticket(
    brand: "Marwa",
    category: "Vêtements",
    logo: "marwa.png",
    date: "19-04-23 à 13:25",
    price: 120.0,
  ),
  Ticket(
    brand: "Yves Rocher",
    category: "Beauté",
    logo: "rocher.png",
    date: "01-02-23 à 10:30",
    price: 120.0,
  ),
  Ticket(
    brand: "Adidas",
    category: "Vêtements",
    logo: "adidas.png",
    date: "23-03-23 à 20:55",
    price: 120.0,
  ),
  Ticket(
    brand: "Yan & One",
    category: "Beauté",
    logo: "yan-one.png",
    date: "01-02-23 à 10:30",
    price: 120.0,
  ),
  Ticket(
    brand: "Zara",
    category: "Vêtements",
    logo: "zara.png",
    date: "08-01-23 à 19:15",
    price: 120.0,
  ),
  Ticket(
    brand: "Electroplanet",
    category: "Mobilier et ameublement",
    logo: "electroplanet.png",
    date: "14-12-22 à 22:40",
    price: 120.0,
  ),
];

bool allowNotification = false;
String text = "";
List<String> brandList =
    tickets.map((ticket) => ticket.brand).toList().toSet().toList();

List zaraPubImages = [
  '$pathImages/zaraPub1.jpg',
  '$pathImages/zaraPub2.jpg',
];
List<String> PubImages = [
  '$pathImages/adidasPub.jpg',
  '$pathImages/etamPub.jpg',
  '$pathImages/marjanePub.jpg',
  '$pathImages/etamPub2.jpg',
  // Add more brand images here
];

List AlimentationBrand = [
  {
    "brand": "Carrfour",
    "logo": "$pathImages/carrfour.png",
  },
  {
    "brand": "Bim",
    "logo": "$pathImages/bim.png",
  },
  {
    "brand": "Marjane",
    "logo": "$pathImages/marjane.png",
  },
];
List BeauteBrand = [
  {
    "brand": "Yan & One",
    "logo": "$pathImages/yan-one.png",
  },
  {
    "brand": "Yves Rocher",
    "logo": "$pathImages/rocher.png",
  },
];
List MobilieretameublementBrand = [
  {
    "brand": "Electroplanet",
    "logo": "$pathImages/electroplanet.png",
  },
];
List VetementsBrand = [
  {
    "brand": "Zara",
    "logo": "$pathImages/zara.png",
  },
  {
    "brand": "LC Waikiki",
    "logo": "$pathImages/lcw.png",
  },
  {
    "brand": "Marwa",
    "logo": "$pathImages/marwa.png",
  },
  {
    "brand": "Etam",
    "logo": "$pathImages/etam.png",
  },
  {
    "brand": "Adidas",
    "logo": "$pathImages/adidas.png",
  },
];
