import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String centerTitle;
  final List<Widget>? actions;
  final Widget? leading;

  const CustomAppbar({
    super.key,
    required this.centerTitle,
    this.actions,
    this.leading,
  });

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    bool checkTitle = widget.centerTitle.isNotEmpty;
    bool checkActions = widget.actions != null && widget.actions!.isNotEmpty;
    bool checkLeading = widget.leading != null;

    return AppBar(
      leadingWidth: 86,
      toolbarHeight: 32,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xffF3F0FF),
      centerTitle: checkTitle,
      elevation: 0,
      shadowColor: Colors.transparent,
      title: checkTitle
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: widget.centerTitle.s(18.sp).w(700).c(Colors.black),
            )
          : null,
      actions: checkActions
          ? [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(children: widget.actions!),
              )
            ]
          : null,
      leading: checkLeading
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: widget.leading,
            )
          : null,
    );
  }
}
