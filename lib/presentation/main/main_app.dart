import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/presentation/main/account/account_section.dart';
import 'package:girls_care/presentation/main/helper/add_note_helper/add_note_helper_page.dart';
import 'package:girls_care/presentation/main/home/home_page.dart';
import 'package:girls_care/presentation/main/main_app_db_service.dart';
import 'package:girls_care/presentation/main/main_app_details.dart';
import 'package:girls_care/presentation/main/helper/helper.dart';
import 'package:girls_care/presentation/main/pregnancy/pregnancy_page.dart';
import 'package:girls_care/presentation/main/pregnancy/widgets/article_preg.dart';
import 'package:provider/provider.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'articles/articles.dart'; // Import your extension

class MainApp extends StatelessWidget {
  final int index;
  final bool isPregnancy;
  const MainApp({super.key, required this.index, required this.isPregnancy});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Consumer<MainAppDbService>(
          builder: (context, state, child) {
      
            final List<Widget> children = [
              isPregnancy ? const PregnancyPage() : const HomePage(),
              isPregnancy ? const ArticlePreg() : const ArticlesPage(),
              const AddNoteHelperPage(),
              const Account(),
            ];

            return children[state.currentIndex];
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Selector<MainAppDbService, bool>(
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
              context.watch<MainAppDbService>().currentIndex == index;
          return GestureDetector(
            onTap: () => context.read<MainAppDbService>().onTabTapped(index),
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
                        navTitle[index]
                            .s(12.sp)
                            .c(isSelected ? Colors.white : Colors.black),
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
