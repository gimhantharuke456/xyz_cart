import 'package:flutter/material.dart';
import 'package:xyz_cart/utils/constants.dart';

class MainContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  const MainContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(defaultPadding * 4),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: child,
    );
  }
}
