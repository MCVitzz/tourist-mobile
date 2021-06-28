import 'package:flutter/material.dart';
import 'package:tourist/data/point_of_interest.dart';
import 'package:tourist/layout/caousel_me.dart';
import 'package:tourist/pages/comment_page.dart';
import 'package:tourist/theme.dart';

import '../utils.dart';

class POIView extends StatefulWidget {
  @override
  _POIViewState createState() => _POIViewState();

  POIView(this.poi);

  final PointOfInterest poi;
}

class _POIViewState extends State<POIView> {
  int _currentIdx = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        MyCarousel(items: widget.poi.images, web: true),
        Padding(
          padding: EdgeInsets.all(28),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                widget.poi.name,
                style: TouristTheme.titleStyle,
              ),
              Text('${Utils.doubleToString(widget.poi.scans)} Scans',
                  style: TouristTheme.titleStyleColored)
            ]),
            Container(height: 15),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: TouristTheme.yellow,
                ),
                Container(width: MediaQuery.of(context).size.width * .02),
                Text(
                    '${widget.poi.ratings} (${Utils.doubleToString(widget.poi.ratingCount)})',
                    style: TextStyle(color: TouristTheme.white)),
              ],
            ),
            Container(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => _pressed(0),
                      child: Text(
                        'Overview',
                        style: TextStyle(
                          color: _currentIdx == 0
                              ? TouristTheme.activeColor
                              : Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 4,
                    ),
                    Icon(
                      Icons.circle,
                      size: 6,
                      color: _currentIdx == 0
                          ? TouristTheme.activeColor
                          : Colors.transparent,
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => _pressed(1),
                      child: Text(
                        'Next Stops',
                        style: TextStyle(
                          color: _currentIdx == 1
                              ? TouristTheme.activeColor
                              : Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 4,
                    ),
                    Icon(
                      Icons.circle,
                      size: 6,
                      color: _currentIdx == 1
                          ? TouristTheme.activeColor
                          : Colors.transparent,
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => _pressed(2),
                      child: Text(
                        'Comments',
                        style: TextStyle(
                          color: _currentIdx == 2
                              ? TouristTheme.activeColor
                              : Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 4,
                    ),
                    Icon(
                      Icons.circle,
                      size: 6,
                      color: _currentIdx == 2
                          ? TouristTheme.activeColor
                          : Colors.transparent,
                    )
                  ],
                ),
              ],
            ),
            Container(height: 15),
            Container(
                height: 240,
                child: PageView(
                    controller: _pageController,
                    onPageChanged: (idx) => _pressed(idx),
                    physics: BouncingScrollPhysics(),
                    children: [
                      Center(
                        child: Text('Overview'),
                      ),
                      Center(
                        child: Text('Location'),
                      ),
                      Center(
                        child: CommentsPage(
                          poi: widget.poi,
                        ),
                      )
                    ]))
          ]),
        ),
      ],
    );
  }

  void _pressed(idx) {
    setState(() {
      this._currentIdx = idx;
    });
  }
}
