// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:girls_care/common/extensions/text_extensions.dart';
// import 'package:girls_care/common/extensions/theme_extensions.dart';
// import 'package:girls_care/common/gen/assets.gen.dart';
// import 'package:girls_care/presentation/main/home/widgets/change_calendar_b.dart';
// import 'package:girls_care/presentation/main/home/widgets/custom_appbar.dart';
// import 'package:girls_care/presentation/main/home/widgets/custom_calendar.dart';

// class CalendarPregnancy extends StatefulWidget {
//   const CalendarPregnancy({super.key});

//   @override
//   State<CalendarPregnancy> createState() => _CalendarPregnancyState();
// }

// class _CalendarPregnancyState extends State<CalendarPregnancy> {
//   bool showCalendar = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: context.colors.backgrounColor,
//       appBar: CustomAppbar(
//         leading: Assets.icons.leftVector.svg(width: 14.w, height: 14.h),
//         centerTitle: "21-SEN",
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24),
//         child: ListView(
//           children: [
//             Center(
//               child: "16 hafta, 2 kun".s(16.sp).w(700),
//             ),
//             SizedBox(height: 4.h),
//             Center(child: "Tug’ruqqacha 176 kun".s(12.sp).w(500)),
//             SizedBox(height: 12.h),
//             "Homila yoshi:".s(16.sp).w(700),
//             SizedBox(height: 12.h),
//             const SizedBox(
//                 width: double.infinity, height: 28, child: WeekDayInput()),
//             SizedBox(height: 20.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 "Oxirgi hayzning 1-kuni:".s(16.sp).w(700),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     InkWell(
//                         onTap: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     const CalendarPregnancy())),
//                         child: SvgPicture.asset("assets/icons/edit_icon.svg")),
//                     SizedBox(width: 4.w),
//                     "6-Yan".s(16.sp).w(600).c(const Color(0xFF8D80C1)),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 20.h),
//             // Visibility(
//             //   visible: showCalendar,
//             //   replacement: const SizedBox.shrink(),
//             //   // child: const CustomCalendar(
//             //   //   hasBackground: false,
//             //   //   hasSize: true,
//             //   //   hasWeekDayContainer: false,
//             //   // ),
//             // ),
//             SizedBox(height: 20.h),
//             ChangeCalendarB(
//                 text: "Homila ma’lumotlarini o’zgartirish",
//                 onPressed: () {
//                   setState(() {
//                     showCalendar = !showCalendar;
//                   });
//                 }),
//             SizedBox(height: 20.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "6-Yan",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 Text(
//                   "Hayz, 4-kun",
//                   style: TextStyle(color: Colors.black, fontSize: 12.sp),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Kayfiyat: Bezovtalik",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w500),
//                 ),
//                 Image.asset("assets/icons/not_good.png",
//                     width: 24.w, height: 24.h),
//               ],
//             ),
//             SizedBox(height: 8.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Simptomlar: Belning pastki qismida og’riq,\nMushaklarda og’riq",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w500),
//                 ),
//                 Image.asset("assets/icons/pain.png", width: 56, height: 24),
//               ],
//             ),
//             SizedBox(height: 8.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Jinsiy aloqa: Himoyalanmagan",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w500),
//                 ),
//                 Image.asset("assets/icons/not_secured.png",
//                     width: 24, height: 24),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
