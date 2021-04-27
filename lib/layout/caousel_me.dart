import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tourist/theme.dart';

class MyCarousel extends StatefulWidget {
  final List<String> items;

  MyCarousel({this.items});

  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        children: [
          Container(
            child: PageView(
              physics: BouncingScrollPhysics(),
              children: _getChildren(),
              controller: _controller,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                controller: _controller,
                count: widget.items.length,
                effect: WormEffect(
                    dotColor: Colors.black.withAlpha(128),
                    activeDotColor: TouristTheme.sliderActiveDotColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getChildren() {
    List<Widget> images = <Widget>[];
    for (String item in widget.items) {
      images.add(Image.asset(
        item,
        fit: BoxFit.fitWidth,
      ));
    }
    return images;
  }
}
