import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/navigation_extensions.dart';
import 'package:girls_care/presentation/main/articles/read_articles.dart';

import 'hayz_davri_details.dart';

class HayzDavriHaqida extends StatefulWidget {
  const HayzDavriHaqida({super.key, required this.articles});

  final List<QueryDocumentSnapshot<dynamic>> articles;

  @override
  State<HayzDavriHaqida> createState() => _HayzDavriHaqidaState();
}

class _HayzDavriHaqidaState extends State<HayzDavriHaqida> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 20.h,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.6),
      ),
      itemCount: widget.articles.length,
      itemBuilder: (context, index) {
        var article = widget.articles[index];
        return InkWell(
          onTap: () {
            context.push(ReadArticles(
                title: article['title'],
                imagePath: hayzContainerDetails[index]['image'].path,
                id: article.id,
                text: article['desc']));
          },
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Container(
              height: 230.h,
              decoration: BoxDecoration(
                color: const Color(0xFFE2DCFE),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.r),
                    ),
                    child: Image.asset(
                      hayzContainerDetails[index]['image'].path,
                      height: 150.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article['title'] ?? "",
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1B1F24)),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          hayzContainerDetails[index]['buttonText']!,
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFEB2D69)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
