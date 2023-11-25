import 'package:flutter/material.dart';
import 'package:survei_asia/res/theme.dart';

class LineIndicator extends StatelessWidget {
  const LineIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 10,
      width: 30,
      decoration: BoxDecoration(
          color: isActive ? pomegranate : greyThinColor,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
