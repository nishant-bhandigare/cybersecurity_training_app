import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Discover extends StatelessWidget{
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text("Discover",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 15),
          Carousel(),
        ],
      ),
    );
  }
}

class Carousel extends StatelessWidget {

  final List<Widget> carouselElements = [
    const CarouselElement(),
    const CarouselElement(),
    const CarouselElement(),
    const CarouselElement(),
    const CarouselElement(),
  ];

  Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        aspectRatio: 16 / 9,
        viewportFraction: 0.7,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.35,
        scrollDirection: Axis.horizontal,
        // enlargeStrategy: CenterPageEnlargeStrategy.,
      ),
      items: carouselElements,
    );
  }
}

class CarouselElement extends StatelessWidget {
  const CarouselElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}