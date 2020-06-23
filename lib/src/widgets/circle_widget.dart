import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Circle extends StatelessWidget {
  final double radius;
  final List<Color> colors;
  final Size sizes;
  final double top;
  final double bottom;
  final double left;
  final double right;
  final double radiusSize;

  const Circle(
      {Key key,
      @required this.sizes,
      @required this.radius,
      @required this.colors,
      @required this.top,
      @required this.bottom,
      @required this.left,
      @required this.right,
      @required this.radiusSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left:   left,
        top:    top,
        right:  right,
        bottom: bottom,
        child: Container(
          width: radius * 2,
          height: radius * 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(this.radius),
              gradient: LinearGradient(
                  colors: colors,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft)),
        ));
  }
}
