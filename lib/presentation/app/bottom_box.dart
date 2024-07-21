import 'package:flutter/material.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';

class BottomBox extends StatelessWidget {
  const BottomBox({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
  });

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: width,
        height: height,
        padding: padding ??
            const EdgeInsets.only(
              top: 16,
              right: 16,
              left: 16,
              bottom: 36,
            ),
        margin: margin,
        decoration: BoxDecoration(color: context.colors.onPrimary),
        child: child,
      ),
    );
  }
}
