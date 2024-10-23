import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/presentation/main/account/account_section.dart';
import 'package:girls_care/presentation/main/helper/helper.dart';
import 'package:girls_care/presentation/main/home/home_page.dart';
import 'package:girls_care/presentation/main/pregnancy/main/main_app_details.dart';
import 'package:provider/provider.dart';

import '../../articles/articles.dart';
import 'klimaks_app_db_service.dart';

class KlimaksMainApp extends StatelessWidget {
  const KlimaksMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Consumer<KlimaksAppService>(
          builder: (context, state, child) {
            final List<Widget> _children = [
              const HomePage(),
              const ArticlesPage(),
              const Helper(),
              const Account(),
            ];
            return _children[state.currentIndex];
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Selector<KlimaksAppService, bool>(
          selector: (_, state) => state.isVisible,
          builder: (context, isVisible, child) {
            return isVisible
                ? _buildFloatingNavBar(context)
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildFloatingNavBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
      decoration: BoxDecoration(
        color: const Color(0xFFE2DCFE),
        borderRadius: BorderRadius.circular(12.r),
      ),
      height: 80.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(navIconsSelected.length, (index) {
          bool isSelected =
              context.watch<KlimaksAppService>().currentIndex == index;
          return GestureDetector(
            onTap: () => context.read<KlimaksAppService>().onTabTapped(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    width: 70.w,
                    height: 60.h,
                    decoration: isSelected
                        ? BoxDecoration(
                            color: const Color(0xFFEB497C),
                            borderRadius: BorderRadius.circular(9.r))
                        : null,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: isSelected
                              ? navIconsSelected[index]
                              : navIconsUnselected[index],
                        ),
                        navTitle[index].s(12.sp).c(isSelected
                            ? Colors.white
                            : Colors.black), // Using your extension
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}