import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/navigation_extensions.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/extensions/widget.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_text_filed.dart';
import 'package:girls_care/presentation/app/my_base_box.dart';
import 'package:girls_care/presentation/main/helper/add_note_helper/add_note_helper_page.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_appbar.dart';
import 'package:girls_care/presentation/main/home/widgets/helper_section_details.dart';
import 'package:intl/intl.dart';

class Helper extends StatefulWidget {
  const Helper({super.key});

  @override
  State<Helper> createState() => _HelperState();
}

class _HelperState extends State<Helper> {
  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();

  final List<String> dayNames = ['DU', 'SE', 'Bugun', 'PA', 'JU', 'SH', 'YA'];

  String getDayNumber(int offset) {
    DateTime date = today.add(Duration(days: offset));
    return DateFormat('d').format(date); // Extract just the day number
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF3F0FF),
        appBar: CustomAppbar(
          centerTitle: "Yordamchi",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSmallCalendar(context),
                24.kh,
                MyBaseBox(
                    selected: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Kundalik".s(18).w(700).c(context.colors.black),
                        16.kh,
                        InkWell(
                          onTap: (){
                            context.push(AddNoteHelperPage());
                          },
                          child: CommonTextField(
                            enabled: false,
                            background: context.colors.onPrimary,
                            hint: "Matnni kiriting...",
                            minLines: 3,
                            maxLines: 5,
                          ),
                        )
                      ],
                    )),
                16.kh,
                MyBaseBox(
                    child: Row(
                  children: [
                    Assets.icons.doriQoshish.image(width: 24.w, height: 24.h),
                    8.kw,
                    "Dori qo'shish".s(16).w(600).c(context.colors.black),
                    Spacer(),
                    Assets.icons.addDori.image(width: 24.w, height: 24.h),
                  ],
                )),
                16.kh,
                MyBaseBox(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Jinsiy aloqa".s(18).w(700),
                    SizedBox(
                      width: double.infinity,
                      height: 76.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: aloqaCircle.length,
                        itemBuilder: (context, index) {
                          String key = aloqaCircle.keys.elementAt(index);
                          Image icon = aloqaCircle.values.elementAt(index);
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 50.w, height: 50.h, child: icon),
                                  key.s(14.sp).w(500).c(Colors.black)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )),
                16.kh,
                MyBaseBox(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Simptomlar".s(18).w(700),
                    24.kh,
                    SizedBox(
                      width: double.infinity,
                      height: 53.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: symtomsSmall.length,
                        itemBuilder: (context, index) {
                          String key = symtomsSmall.keys.elementAt(index);
                          Image icon = symtomsSmall.values.elementAt(index);
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 24.w, height: 24.h, child: icon),
                                  key.s(14.sp).w(500).c(Colors.black)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    16.kh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Barchasini ko’rish".s(14).w(600).c(context.colors.primary)
                      ],
                    )
                  ],
                )),
                16.kh,
                MyBaseBox(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Kayfiyatlar".s(18).w(700),
                    24.kh,
                    SizedBox(
                      width: double.infinity,
                      height: 53.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: moodSmall.length,
                        itemBuilder: (context, index) {
                          String key = moodSmall.keys.elementAt(index);
                          Image icon = moodSmall.values.elementAt(index);
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 24.w, height: 24.h, child: icon),
                                  key.s(14.sp).w(500).c(Colors.black)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    16.kh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Barchasini ko’rish".s(14).w(600).c(context.colors.primary)
                      ],
                    )
                  ],
                )),
                154.kh,
              ],
            ),
          ),
        ));
  }

  Row buildSmallCalendar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        DateTime date = today.add(Duration(days: index - 3));
        bool isToday = date.day == today.day &&
            date.month == today.month &&
            date.year == today.year;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedDate = date;
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              dayNames[index].s(12).w(600).c(context.colors.black),
              CircleAvatar(
                backgroundColor: isToday ? Colors.purple : Colors.transparent,
                child: getDayNumber(index - 3).s(18).w(700).c(
                    isToday ? context.colors.onPrimary : context.colors.black),
              ),
            ],
          ),
        );
      }),
    );
  }
}
