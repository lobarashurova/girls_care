import 'package:flutter/material.dart';
import 'package:girls_care/common/di/injection.dart';
import 'package:girls_care/common/extensions/navigation_extensions.dart';
import 'package:girls_care/common/extensions/notification_extensions.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_button.dart';
import 'package:girls_care/common/widget/common_text_filed.dart';
import 'package:girls_care/data/storage/storage.dart';
import 'package:girls_care/presentation/auth/register_total/register_total.dart';
import 'package:intl/intl.dart';
import 'package:pinput/pinput.dart';

class RegisterSimplerPage extends StatefulWidget {
  const RegisterSimplerPage({super.key});

  @override
  State<RegisterSimplerPage> createState() => _RegisterSimplerPageState();
}

class _RegisterSimplerPageState extends State<RegisterSimplerPage> {
  TextEditingController dayController = TextEditingController();
  TextEditingController siklController = TextEditingController();
  DateTime? selectedDay;
  TextEditingController lastDayController = TextEditingController();
  final storage = getIt<Storage>();

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                height: MediaQuery.of(context).size.height * 2 / 3 + 60,
                decoration: BoxDecoration(
                    color: context.colors.onPrimary,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(24))),
                child: Column(
                  children: [
                    SizedBox(
                      width: 80,
                      child: LinearProgressIndicator(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3)),
                        color: context.colors.primary2.withOpacity(0.1),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    "Ma’lumotlarni kiriting:".s(24).w(700).a(TextAlign.center),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                                child: CommonTextField(
                              controller: dayController,
                              hint: "O’rtacha hayz kunlari",
                              keyboardType: TextInputType.number,
                              maxLength: 2,
                              onChanged: (text) {
                                setState(() {});
                              },
                            )),
                            SizedBox(
                              width: 16,
                            ),
                            Flexible(
                                child: CommonTextField(
                              keyboardType: TextInputType.number,
                              hint: "O’rtacha sikl kunlari",
                              controller: siklController,
                              maxLength: 2,
                              onChanged: (text) => setState(() {}),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        "Hayz davomiyligi va hayzlar orasidagi taxminiy davrni kiriting "
                            .s(12)
                            .w(400)
                            .c(context.colors.display),
                        SizedBox(
                          height: 32,
                        ),
                        CommonTextField(
                          controller: lastDayController,
                          hint: "Oxirgi hayzning boshlanish sanasini kiriting",
                          suffix:
                              Assets.icons.calendar.svg(width: 20, height: 20),
                          suffixPressed: () async {
                            selectedDay = await showDatePicker(
                              context: context,
                              initialDate: selectedDay ?? DateTime.now(),
                              // Default to current date if none selected
                              firstDate: DateTime(2000),
                              // Start of range
                              lastDate: DateTime(2101),
                            );
                            setState(() {});
                            lastDayController.setText(DateFormat('dd-MM-yyyy')
                                .format(selectedDay ?? DateTime.now()));
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        "Ilova navbatdagi hayz davrini hisoblashi uchun"
                            .s(12)
                            .w(400)
                            .c(context.colors.display)
                      ],
                    ),
                    const Spacer(),
                    CommonButton.elevated(
                      text: "Saqlash va davom etish",
                      onPressed: () {
                        if (siklController.text.isNotEmpty &&
                            siklController.text.length < 3 &&
                            dayController.text.isNotEmpty &&
                            dayController.text.length < 3 &&
                            selectedDay != null) {
                          storage.avarageHayz
                              .set(int.parse(dayController.text.toString()));
                          storage.avarageSikl
                              .set(int.parse(siklController.text.toString()));
                          storage.lastDay
                              .set((lastDayController.text.toString()));

                          context.push(const RegisterTotalPage());
                        } else {
                          context.showElegantNotification(
                              title: "Maydonlarda xatolik!",
                              description:
                                  "Sikl va o'rtacha hayz kunlar bo'sh va 3 xonali son bo'lolmaydi",
                              type: NotificationType.info);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterTotalPage()));
                        },
                        child: "Ma’lumotlarni kiritmasdan davom etish"
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
