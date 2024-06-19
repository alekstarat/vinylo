import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> popList = [
  'https://disco.market/optimpictures/images/d2e84f09df3ff0d7e4152150d2a76179/bpqj5qhl56qcq9i6qon2ji2p1vlvmkat.jpeg.webp',
  'https://disco.market/optimpictures/images/2b9bedb8d7492432301b2e69449f59a1/j4pg12zv3vpep72tdjwk6welfsghduxx.jpeg.webp',
  'https://disco.market/optimpictures/images/d393c68dc32c355858307bc87fefcff9/y6tr6ap4qrd639wwetuccvit13vlc013.jpeg.webp',
  'https://disco.market/optimpictures/images/1a0c5860bf1a066beaa6f21550b44b89/tyrkrmondtctb83bs1lv733o7b0qn4ip.jpeg.webp',
  'https://disco.market/optimpictures/images/d68c9a4703d3844c7834fe4e82084f22/ictstlgv9xk491sc7qmaja18g9tpsz9e.jpeg.webp'
];

CarouselSlider popular() {
  return CarouselSlider(
    options: CarouselOptions(
      viewportFraction: 0.7,
      height: 400.0,
    ),
    items: [0, 1, 2, 3, 4].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Column(
            children: [
              SizedBox(
                height: 250,
                child: Image.network(popList[i]),
              ),
              const Text(
                'Название',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              const Text('Цена', style: TextStyle(fontSize: 20))
            ],
          );
        },
      );
    }).toList(),
  );
}
