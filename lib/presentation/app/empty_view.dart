import 'package:flutter/material.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';

import '../../common/widget/common_button.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({
    super.key,
    this.icon,
    this.description,
    this.title,
    this.buttonText,
    this.click,
  });

  final Widget? icon;
  final String? title;
  final String? description;
  final String? buttonText;
  final VoidCallback? click;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon ?? Assets.icons.appLauncher.image(),
          const SizedBox(height: 48),
          (title ?? '')
              .s(20)
              .w(600)
              .c(context.colors.black)
              .copyWith(textAlign: TextAlign.center),
          const SizedBox(height: 16),
          (description ?? '')
              .s(16)
              .w(400)
              .c(context.colors.title)
              .copyWith(textAlign: TextAlign.center),
          if (click != null)
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 44,
                vertical: 36,
              ),
              child: CommonButton.elevated(
                onPressed: click,
                text: buttonText ?? "Strings.goVerification",
              ),
            )
        ],
      ),
    );
  }
}
