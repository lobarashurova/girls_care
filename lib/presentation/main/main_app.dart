import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/presentation/main/hisob/hisob.dart';
import 'package:girls_care/presentation/main/home/home_page.dart';
import 'package:girls_care/presentation/main/main_app_db_service.dart';
import 'package:girls_care/presentation/main/maqolalar/maqolalar.dart';
import 'package:girls_care/presentation/main/yordamchi/yordamchi.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification) {
              Provider.of<MainAppDbService>(context, listen: false)
                  .handleScroll();
            }
            return true;
          },
          child: Consumer<MainAppDbService>(
            builder: (context, state, child) {
              final List<Widget> _children = [
                const HomePage(),
                const MaqolalarPage(),
                const Yordamchi(),
                const Hisob(),
              ];
              return _children[state.currentIndex];
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Consumer<MainAppDbService>(
          builder: (context, state, child) {
            return state.isVisible
                ? _buildFloatingNavBar(context)
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildFloatingNavBar(BuildContext context) {
    List<String> navTitle = ["Asosiy", "Maqolalar", "Yordamchi", "Hisob"];

    List<Widget> navIconsSelected = [
      Assets.icons.asosiySelected.svg(width: 20.w, height: 20.h),
      Assets.icons.maqolalarSelect.svg(width: 20.w, height: 20.h),
      Assets.icons.yordamchiSelect.svg(width: 20.w, height: 20.w),
      Assets.icons.hisobSelect.svg(width: 20.w, height: 20.w),
    ];

    List<Widget> navIconsUnselected = [
      Assets.icons.asosiyUnselect.svg(width: 20.w, height: 20.w),
      Assets.icons.maqolalarUnselect.svg(width: 20.w, height: 20.w),
      Assets.icons.yordamchiUnselect.svg(width: 20.w, height: 20.w),
      Assets.icons.hisobUnselect.svg(width: 20.w, height: 20.w),
    ];

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
                        Text(
                          navTitle[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontSize: 12.sp,
                          ),
                        ),
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