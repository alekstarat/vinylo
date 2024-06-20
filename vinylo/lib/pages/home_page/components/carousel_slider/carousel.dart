import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  List<String> images = [
    "https://disco.market/optimpictures/images/2b8606e394d722b2ee3001ff89225f2b/md2d1u0vuofwcvipu3l1sk1d8da9vg05.png.webp",
    "https://disco.market/optimpictures/images/144ddf1047b794e2f6ea8abd2420c337/9fmo3z9yu085ipgmn86rw1knyeqcplx8.png.webp",
    "https://disco.market/optimpictures/images/05f719567411396f89ae099dcb2195b0/ysrr4eb8pscpuwa18mdjuaxwhtw66n6t.jpg.webp",
    "https://disco.market/optimpictures/images/53a7d9d5a37a17e1e401c9adda6f8757/pnffmem8x8yj1e79zus7cai1qrqfoqyi.png.webp",
    "https://disco.market/optimpictures/images/b40c123800b1eb617e08d79ce8d8f13e/y2r03uktdsylhsf6ynp1vb4wmyf2oayd.png.webp",
  ];

  int idx = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: CarouselSlider(
              items: images.map((i) => Image(image: NetworkImage(i))).toList(), 
              options: CarouselOptions(
                viewportFraction: 1,
                height: 114,
                onPageChanged: (index, reason) {
                  setState(() {
                    idx = index;
                  });
                },
              )
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: DotsIndicator(
            decorator: DotsDecorator(
              activeColor: ThemeProvider.themeOf(context).data.primaryColor,
              color: Colors.grey,
              spacing: const EdgeInsets.all(2),
              activeSize: const Size.square(7),
              size: const Size.square(7)
          
            ),
            dotsCount: images.length,
            position: idx,
          ),
        )
      ],
    );
  }
}