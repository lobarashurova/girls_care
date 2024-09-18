import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar(
      {super.key,
      this.title,
      this.actions,
      this.centerTitle = true,
      this.leading,
      this.hasIcon = false,
      this.backgroundColor,
      this.onPressed});

  final String? title;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final bool hasIcon;
  final Color? backgroundColor;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    final canPop = context.router.canPop();
    return AppBar(
      elevation: 1,
      iconTheme: IconThemeData(
          color: backgroundColor != null
              ? context.colors.onPrimary
              : context.colors.label),
      // leading: leading ?? (canPop ? appBarLeading(context) : null),
      centerTitle: centerTitle,
      title: hasIcon
          ? Assets.icons.appLauncher.image(width: 96, height: 28)
          : InkWell(
              onTap: () => onPressed?.call(),
              child: (title ?? '').w(600).s(16).c(backgroundColor != null
                  ? context.colors.onPrimary
                  : context.colors.label),
            ),
      backgroundColor: backgroundColor ?? context.colors.onPrimary,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}

Widget appBarLeading(BuildContext context) {
  return IconButton(
    onPressed: () => context.router.maybePop(),
    iconSize: 36,
    icon: Icon(Icons.chevron_left_outlined, color: context.colors.label),
  );
}
