import 'package:corail/common/variable.dart';
import 'package:corail/widgets/brandCard.dart';
import 'package:flutter/material.dart';

class BrandList extends StatelessWidget {
  BrandList({
    required this.category,
    super.key,
  });
  final String category;

  List ticketsList = [];
  @override
  Widget build(BuildContext context) {
    if (category == 'Vêtements') {
      ticketsList = VetementsBrand;
    } else if (category == 'Beauté') {
      ticketsList = BeauteBrand;
    } else if (category == 'Alimentation') {
      ticketsList = AlimentationBrand;
    } else if (category == 'Mobilier et ameublement') {
      ticketsList = MobilieretameublementBrand;
    } else {}
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 18),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < ticketsList.length; i++)
            BrandCard(
                brand: ticketsList[i]["brand"], logo: ticketsList[i]["logo"]),
        ],
      ),
    );
  }
}
