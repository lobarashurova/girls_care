import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/presentation/main/articles/widgets/daily_themes.dart';
import 'package:girls_care/presentation/main/articles/widgets/hayz_davri_haqida.dart';
import 'package:girls_care/presentation/main/articles/widgets/search_textfield.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_appbar.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('articles').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text("No articles found"));
          }
          final articles = snapshot.data!.docs;
          return Scaffold(
            appBar: const CustomAppbar(centerTitle: "Maqolalar"),
            backgroundColor: const Color(0xffF3F0FF),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SearchField(),
                    SizedBox(height: 22.h),
                    "Kun mavzusi".s(18.sp).w(700),
                    SizedBox(height: 30.h),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const DailyThemes(),
                        Positioned(
                          top: -20,
                          right: 0,
                          child: CircleAvatar(
                            radius: 27,
                            backgroundColor: const Color(0xFFE2DCFE),
                            child: Center(
                              child: "Barchasi"
                                  .s(10.sp)
                                  .w(600)
                                  .c(const Color(0xFF0FFEB2D69)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 22.h),
                    "Hayz davri haqida"
                        .s(18.sp)
                        .w(700)
                        .c(const Color(0xFF1B1F24)),
                    SizedBox(height: 8.h),
                    HayzDavriHaqida(
                      articles: articles,
                    ),
                    SizedBox(height: 120.h),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
