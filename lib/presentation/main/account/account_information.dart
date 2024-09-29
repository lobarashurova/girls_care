import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/di/injection.dart';
import 'package:girls_care/common/extensions/navigation_extensions.dart';
import 'package:girls_care/common/extensions/notification_extensions.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/data/storage/storage.dart';
import 'package:girls_care/presentation/app/custom_dialog.dart';
import 'package:girls_care/presentation/auth/login/login_page.dart';
import 'package:girls_care/presentation/main/account/widgets/change_account_information.dart';
import 'package:girls_care/presentation/main/account/widgets/custom_listtile.dart';
import 'package:pinput/pinput.dart';

class AccountInformation extends StatefulWidget {
  const AccountInformation({super.key});

  @override
  State<AccountInformation> createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  final storage = getIt<Storage>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F0FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F0FF),
        foregroundColor: const Color(0xFFF3F0FF),
        centerTitle: true,
        title: "Shaxsiy ma’lumotlar".s(18.sp).w(700).c(const Color(0xFF1B1F24)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () {
                context.pop();
              },
              child: Assets.icons.close.svg(),
            ),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              ChangeAccountInformation(
                name: storage.name.call() ?? "",
              ),
              CustomListTile(
                onTap: () {},
                isMoreLine: true,
                items: [
                  CustomListTileItem(
                      text: 'Ismni o’zgartirish',
                      prefix: Assets.icons.rightVector
                          .svg(width: 24.w, height: 24.h),
                      suffix: null,
                      onTap: () {
                        _showCustomChangeNameDialog(context);
                        setState(() {});
                      }),
                  CustomListTileItem(
                    text: 'Aloqa ma’lumotlarini tahrirlash',
                    prefix:
                        Assets.icons.rightVector.svg(width: 24.w, height: 24.h),
                    suffix: null,
                  ),
                  CustomListTileItem(
                    text: 'Tug’ilgan sanani o’zgartirish',
                    prefix:
                        Assets.icons.rightVector.svg(width: 24.w, height: 24.h),
                    suffix: null,
                  ),
                  CustomListTileItem(
                    text: 'Vazn & bo’y ma’lumotlarini tahrirlash',
                    prefix:
                        Assets.icons.rightVector.svg(width: 24.w, height: 24.h),
                    suffix: null,
                  ),
                  CustomListTileItem(
                    text: 'Hisobni o’chirish',
                    prefix: null,
                    suffix: null,
                  ),
                  CustomListTileItem(
                      text: 'Chiqish',
                      prefix: null,
                      suffix: null,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (dialogContext) => CustomDialog(
                                  title: "Rostan ham chiqishni xohlaysizmi?",
                                  description: "Ilovadan chiqish",
                                  rightTapTitle: "Chiqish",
                                  leftTapTitle: "Bekor qilish",
                                  onRightTap: () {
                                    storage.enabled.set(null);
                                    storage.password.set(null);
                                    storage.phone.set(null);
                                    storage.mode.set(null);
                                    context.pushAndRemoveAll(const LoginPage());
                                    dialogContext.pop();
                                  },
                                  onLeftTap: () => dialogContext.pop(),
                                ));
                      }),
                ],
              ),
            ],
          )),
    );
  }

  TextEditingController _nameController = TextEditingController();

  Future<void> _showCustomChangeNameDialog(BuildContext context) async {
    _nameController.setText(storage.name.call() ?? "");
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Title
                Text(
                  "Change Name",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                // TextField for Name Input
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Enter new name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Cancel Button
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // Change Button
                    ElevatedButton(
                      onPressed: () {
                        if (_nameController.text.isNotEmpty) {
                          storage.name.set(_nameController.text);
                        } else {
                          context.showElegantNotification(
                              title: "Ism bo'sh bo'lolmaydi",
                              description: "",
                              type: NotificationType.info);
                        }

                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: const Text(
                        "O'zgartirish",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
