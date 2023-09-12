import 'package:corail/widgets/carouselCard.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PubSection extends StatelessWidget {
  final List images;

  const PubSection({super.key, 
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return CarouselCard(
              imageUrl: item,
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        // height: 500,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}
