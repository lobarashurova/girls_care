import 'package:flutter/material.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';

class BaseBox extends StatelessWidget {
  const BaseBox(
      {super.key,
      required this.child,
      this.width,
      this.height,
      this.selected = false,
      this.margin,
      this.padding,
      this.onTap,
      this.backgroundColor});

  final Widget child;
  final double? width;
  final double? height;
  final bool selected;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Container(
        height: height,
        width: width,
        padding: padding ?? const EdgeInsets.all(16),
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor ?? context.colors.onPrimary,
          borderRadius: BorderRadius.circular(16),
          border: selected ? Border.all(color: context.colors.primary) : null,
        ),
        child: child,
      ),
    );
  }
}
