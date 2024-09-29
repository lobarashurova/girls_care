import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/extensions/navigation_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_text_filed.dart';
import 'package:girls_care/main.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_appbar.dart';
import 'package:girls_care/presentation/main/main_app.dart';

class AddNoteHelperPage extends StatefulWidget {
  const AddNoteHelperPage({super.key});

  @override
  State<AddNoteHelperPage> createState() => _AddNoteHelperPageState();
}

class _AddNoteHelperPageState extends State<AddNoteHelperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colors.backgrounColor,
        appBar: CustomAppbar(
          centerTitle: "Kundalik",
          leading: Assets.icons.leftVector.svg(),
          actions: [
            InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                onTap: () {
                  context.push(const MainApp(
                    index: 1,
                    isPregnancy: false,
                  ));
                },
                child: Assets.icons.checkPink.svg())
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: const CommonTextField(
                  minLines: 89,
                  maxLines: 90,
                  hint: "Matnni kiriting...",
                ),
              ),
              // SizedBox(height: 60.h),
            ],
          ),
        ));
  }
}
