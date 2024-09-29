import 'package:flutter/material.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/widget/common_button.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.description,
    this.mainTapTitle,
    this.leftTapTitle,
    this.rightTapTitle,
    this.onMainTap,
    this.onLeftTap,
    this.onRightTap,
  });

  final String title;
  final String description;
  final String? mainTapTitle;
  final String? leftTapTitle;
  final String? rightTapTitle;
  final VoidCallback? onMainTap;
  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            title.s(20).w(600).c(context.colors.headline).a(TextAlign.center),
            const SizedBox(height: 16),
            description
                .s(16)
                .w(400)
                .c(context.colors.title)
                .copyWith(textAlign: TextAlign.center),
            const SizedBox(height: 36),
            if (onRightTap != null)
              Row(
                children: [
                  Flexible(
                    child: CommonButton.elevated(
                      text: leftTapTitle ?? "",
                      textColor: context.colors.primary,
                      backgroundColor: context.colors.lightBlue,
                      onPressed: onLeftTap,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: CommonButton.elevated(
                      text: rightTapTitle ?? "Strings.turnOff",
                      onPressed: onRightTap,
                    ),
                  ),
                ],
              ),
            if (onMainTap != null)
              CommonButton.elevated(
                text: mainTapTitle ?? "Strings.continueKey",
                shadow: true,
                onPressed: onMainTap,
              ),
          ],
        ),
      ),
    );
  }
}
