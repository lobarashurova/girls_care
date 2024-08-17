import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_appbar.dart';
import 'package:girls_care/presentation/main/maqolalar/widgets/hayz_davri_haqida.dart';
import 'package:girls_care/presentation/main/maqolalar/widgets/kun_mavzusi_widget.dart';
import 'package:girls_care/presentation/main/maqolalar/widgets/search_textfield.dart';

class MaqolalarPage extends StatefulWidget {
  const MaqolalarPage({super.key});

  @override
  State<MaqolalarPage> createState() => _MaqolalarPageState();
}

class _MaqolalarPageState extends State<MaqolalarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(centerTitle: "Maqolalar"),
      backgroundColor: const Color(0xffF3F0FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SearchField(),
            SizedBox(height: 22.h),
            const KunMavzusiWidget(),
            SizedBox(height: 22.h),
            const Expanded(child: HayzDavriHaqida()),
          ],
        ),
      ),
    );
  }
}
