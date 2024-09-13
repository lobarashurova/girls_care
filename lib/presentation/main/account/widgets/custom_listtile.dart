import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';

class CustomListTileItem {
  final String text;
  final Widget? prefix;
  final Widget? suffix;

  CustomListTileItem({
    required this.text,
    this.prefix,
    this.suffix,
  });
}

class CustomListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final List<CustomListTileItem> items;
  final bool isMoreLine;
  final Color color;

  const CustomListTile({
    super.key,
    required this.items,
    required this.onTap,
    this.isMoreLine = false,  this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: const Color(0xFFFAF9FF),
        ),
        child: isMoreLine
            ? Column(
                children: [
                  for (int i = 0; i < items.length; i++) ...[
                    _buildRow(items[i]),
                    if (i < items.length - 1) SizedBox(height: 10.h),
                  ],
                ],
              )
            : _buildRow(items.first),
      ),
    );
  }

  Widget _buildRow(CustomListTileItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          item.text.s(16).w(400).c(const Color(0xFF1B1F24)),
          item.prefix ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
