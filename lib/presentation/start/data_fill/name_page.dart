import 'package:flutter/material.dart';
import 'package:girls_care/common/di/injection.dart';
import 'package:girls_care/common/extensions/notification_extensions.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_button.dart';
import 'package:girls_care/common/widget/common_text_filed.dart';
import 'package:girls_care/data/storage/storage.dart';
import 'package:girls_care/presentation/start/data_fill/age_page.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final storage = getIt<Storage>();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3 - 15,
              child: Assets.icons.backgound.image(fit: BoxFit.cover),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                height: MediaQuery.of(context).size.height * 2 / 3 + 60,
                decoration: BoxDecoration(
                    color: context.colors.onPrimary,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24))),
                child: Column(
                  children: [
                    SizedBox(
                      width: 80,
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        color: context.colors.primary2.withOpacity(0.1),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    "Mali sizga qanday murojaat qilishini xohlaysiz?"
                        .s(24)
                        .w(700)
                        .a(TextAlign.center),
                    SizedBox(
                      height: 40,
                    ),
                    CommonTextField(
                      autofocus: true,
                      controller: nameController,
                      capitalization: TextCapitalization.sentences,
                      hint: "Ismni kiriting",
                      onChanged: (text) {
                        setState(() {});
                      },
                    ),
                    Spacer(),
                    CommonButton.elevated(
                      text: "Saqlash va davom etish",
                      onPressed: () {
                        if (nameController.text.length > 3) {
                          storage.name.set(nameController.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AgePage()));
                        } else {
                          context.showElegantNotification(
                              title: "Ismda xatolik!",
                              description:
                                  "Ism 3 ta harfdan ko'p bo'lishi kerak",
                              type: NotificationType.info);
                        }
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AgePage()));
                        },
                        child: "Ismni kiritmasdan davom etish"
                            .s(16)
                            .w(700)
                            .c(context.colors.primary))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
