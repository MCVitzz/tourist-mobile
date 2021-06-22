import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:tourist/layout/fab_icon.dart';
import 'package:tourist/services/providers/provider.dart';
import 'package:tourist/theme.dart';

class NavBar extends StatefulWidget {
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;
  final IconData icon4;
  final IconData fabIcon;
  final Function fabAction;
  final Function navBarAction;

  NavBar(this.icon1, this.icon2, this.icon3, this.icon4, this.fabIcon,
      this.fabAction, this.navBarAction);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;

  setPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        height: 80,
        color: Colors.transparent,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width, 80),
              painter: NicePainter(),
            ),
            Center(
              heightFactor: 0.6,
              child: FABIcon(
                icon: widget.fabIcon,
                onPressed: () async {
                  widget.fabAction.call();
                },
              ),
            ),
            Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      splashRadius: 0.1,
                      color: (this.currentIndex == 0)
                          ? TouristTheme.navBarItemColorActive
                          : TouristTheme.navBarItemColor,
                      icon: Icon(this.widget.icon1),
                      onPressed: () {
                        _pressed(0);
                      }),
                  IconButton(
                      splashRadius: 0.1,
                      color: (this.currentIndex == 1)
                          ? TouristTheme.navBarItemColorActive
                          : TouristTheme.navBarItemColor,
                      icon: Icon(Icons.search),
                      onPressed: () {
                        _pressed(1);
                      }),
                  Container(
                    width: MediaQuery.of(context).size.width * .2,
                  ),
                  IconButton(
                      splashRadius: 0.1,
                      color: (this.currentIndex == 2)
                          ? TouristTheme.navBarItemColorActive
                          : TouristTheme.navBarItemColor,
                      icon: Icon(Icons.room_outlined),
                      onPressed: () {
                        _pressed(2);
                      }),
                  IconButton(
                      splashRadius: 0.1,
                      color: (this.currentIndex == 3)
                          ? TouristTheme.navBarItemColorActive
                          : TouristTheme.navBarItemColor,
                      icon: Icon(Icons.person),
                      onPressed: () {
                        _pressed(3);
                      }),
                ],
              ),
            )
          ],
        ));
  }

  void _pressed(idx) {
    setState(() {
      this.currentIndex = idx;
      this.widget.navBarAction(idx);
    });
  }
}

class NicePainter extends CustomPainter {
  Color bg = TouristTheme.navBarBackgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = bg
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * .2, 0, size.width * .35, 0);
    path.quadraticBezierTo(size.width * .4, 0, size.width * .4, 20);
    path.arcToPoint(Offset(size.width * 0.6, 20),
        radius: Radius.circular(10), clockwise: false);
    path.quadraticBezierTo(size.width * .6, 0, size.width * .65, 0);
    path.quadraticBezierTo(size.width * .8, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
