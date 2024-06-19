import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://disco.market/optimpictures/images/2b8606e394d722b2ee3001ff89225f2b/md2d1u0vuofwcvipu3l1sk1d8da9vg05.png.webp',
  'https://disco.market/optimpictures/images/144ddf1047b794e2f6ea8abd2420c337/9fmo3z9yu085ipgmn86rw1knyeqcplx8.png.webp',
  'https://disco.market/optimpictures/images/53a7d9d5a37a17e1e401c9adda6f8757/pnffmem8x8yj1e79zus7cai1qrqfoqyi.png.webp',
  'https://disco.market/optimpictures/images/b40c123800b1eb617e08d79ce8d8f13e/y2r03uktdsylhsf6ynp1vb4wmyf2oayd.png.webp',
  'https://disco.market/optimpictures/images/05f719567411396f89ae099dcb2195b0/ysrr4eb8pscpuwa18mdjuaxwhtw66n6t.jpg.webp'
];

CarouselSlider carousel() {
  return CarouselSlider(
    options: CarouselOptions(
      viewportFraction: 1,
      height: 100.0,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 5),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
    ),
    items: [0, 1, 2, 3, 4].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Image.network(imgList[i]);
        },
      );
    }).toList(),
  );
}
