import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';

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
      leadingWidth: 22,
      // Reduce this value
      toolbarHeight: 32,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xffF3F0FF),
      centerTitle: checkTitle,
      elevation: 0,
      shadowColor: Colors.transparent,
      title: checkTitle
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: widget.centerTitle.s(18.sp).w(700).c(context.colors.black),
            )
          : null,
      actions: checkActions
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Row(children: widget.actions!),
              )
            ]
          : null,
      leading: checkLeading
          ? Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: GestureDetector(
                child: SizedBox(child: widget.leading, width: 20, height: 20),
                // Adjusted size
                onTap: () => Navigator.pop(context),
              ),
            )
          : null,
    );
  }
}
