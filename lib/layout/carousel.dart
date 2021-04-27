// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class ActiveDot extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 8.0),
//       child: Container(
//         width: 20,
//         height: 5,
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(5),
//         ),
//       ),
//     );
//   }
// }

// class InactiveDot extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 8.0),
//       child: Container(
//         width: 8,
//         height: 5,
//         decoration: BoxDecoration(
//           color: Colors.black.withOpacity(0.3),
//           borderRadius: BorderRadius.circular(5),
//         ),
//       ),
//     );
//   }
// }

// /*
//  * for slider home page
//  */
// class Carousel extends StatefulWidget {
//   final List<String> items;

//   Carousel({this.items});

//   @override
//   _CarouselState createState() => _CarouselState();
// }

// class _CarouselState extends State<Carousel> {
//   CarouselController _controller = CarouselController();

//   int activeIndex = 0;
//   setActiveDot(index) {
//     setState(() {
//       activeIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 30, top: 40),
//       child: Column(
//         // overflow: Overflow.visible,
//         children: <Widget>[
//           Container(
//             height: 300,
//             width: MediaQuery.of(context).size.width,
//             child: CarouselSlider(
//               options: CarouselOptions(
//                 onPageChanged: (index, reason) {
//                   setActiveDot(index);
//                 },
//                 autoPlayCurve: Curves.fastLinearToSlowEaseIn,
//                 autoPlayAnimationDuration: Duration(seconds: 2),
//                 viewportFraction: 1.0,
//               ),
//               items: widget.items.map((item) {
//                 return Builder(
//                   builder: (BuildContext context) {
//                     return Stack(
//                       children: <Widget>[
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           child: Image(
//                             image: AssetImage(item),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//           SmoothPageIndicator(
//             controller: _controller.state,
//             count: widget.items.length,
//             effect: WormEffect(),
//             onDotClicked: (i) {},
//           )
//           // Row(
//           //     mainAxisAlignment: MainAxisAlignment.center,
//           //     children: List.generate(widget.items.length, (idx) {
//           //       return activeIndex == idx ? ActiveDot() : InactiveDot();
//           //     }))
//         ],
//       ),
//     );
//   }
// }
