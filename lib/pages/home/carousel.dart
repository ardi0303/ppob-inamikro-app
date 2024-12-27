import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

final List<String> images = [
  'assets/images/carousel1.png',
  'assets/images/carousel2.png',
  'assets/images/carousel3.png',
];

late List<Widget> carouselImages;

int activeIndex = 0;

final PageController pageController = PageController(initialPage: 0);

class _CarouselWidgetState extends State<CarouselWidget> {
  @override
  void initState() {
    super.initState();
    carouselImages = List.generate(
      images.length,
      (index) => ClipRRect(
        borderRadius: BorderRadius.circular(10.0), // Set your desired curve here
        child: Image.asset(
          images[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28.0, bottom: 20.0),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200.0,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return carouselImages[index];
                  },
                ),
              ),
              Positioned(
                bottom: 10.0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                      carouselImages.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: CircleAvatar(
                          radius: 4.0,
                          backgroundColor: activeIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
