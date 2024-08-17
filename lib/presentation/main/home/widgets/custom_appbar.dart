import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xffF3F0FF),
      centerTitle: checkTitle,
      elevation: 0,
      shadowColor: Colors.transparent,
      leadingWidth: 10,
      title: checkTitle
          ? Text(
              semanticsLabel: widget.centerTitle,
              widget.centerTitle,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.balooTamma2().fontFamily,
              ),
            )
          : null,
      actions: checkActions ? widget.actions : null,
      leading: checkLeading ? widget.leading : null,
    );
  }
}
