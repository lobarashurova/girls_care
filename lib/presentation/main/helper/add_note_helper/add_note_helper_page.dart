import 'package:flutter/material.dart';
import 'package:girls_care/common/extensions/navigation_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_text_filed.dart';
import 'package:girls_care/presentation/main/home/widgets/custom_appbar.dart';

class AddNoteHelperPage extends StatefulWidget {
  const AddNoteHelperPage({super.key});

  @override
  State<AddNoteHelperPage> createState() => _AddNoteHelperPageState();
}

class _AddNoteHelperPageState extends State<AddNoteHelperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          centerTitle: "Kundalik",
          leading: Assets.icons.leftVector.svg(),
          actions: [InkWell(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            onTap: (){
              context.pop();
            },
              child: Assets.icons.checkPink.svg())],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CommonTextField(
            minLines: 89,
            maxLines: 90,
            hint: "Matnni kiriting...",
          ),
        ));
}
}
