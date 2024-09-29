import 'package:flutter/material.dart';
import 'package:girls_care/common/extensions/text_extensions.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:girls_care/common/gen/assets.gen.dart';
import 'package:girls_care/common/widget/common_button.dart';
import 'package:girls_care/common/widget/common_text_filed.dart';
import 'package:girls_care/data/api_model/register_data/register_data.dart';
import 'package:girls_care/presentation/auth/register/provider/register_provider.dart';
import 'package:girls_care/presentation/main/home/home_page.dart';
import 'package:girls_care/presentation/main/main_app.dart';
import 'package:provider/provider.dart';

class RegisterTotalPage extends StatefulWidget {
  const RegisterTotalPage({super.key});

  @override
  State<RegisterTotalPage> createState() => _RegisterTotalPageState();
}

class _RegisterTotalPageState extends State<RegisterTotalPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rewritePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RegisterProvider registerProvider = Provider.of<RegisterProvider>(context);
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
                    "Ma’lumotlarni kiriting:".s(24).w(700).a(TextAlign.center),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Telefon raqamingizni kiriting:".s(12).w(400),
                        SizedBox(
                          height: 16,
                        ),
                        CommonTextField(
                          controller: phoneController,
                          prefixIcon:
                              "+998".s(16).w(400).c(context.colors.display),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        "Maxfiy kodni kiriting::".s(12).w(400),
                        SizedBox(
                          height: 8,
                        ),
                        CommonTextField(
                          controller: passwordController,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        "Kodni takrorlang::".s(12).w(400),
                        SizedBox(
                          height: 8,
                        ),
                        CommonTextField(
                          controller: rewritePasswordController,
                          obscureText: true,
                        ),
                      ],
                    ),
                    Spacer(),
                    CommonButton.elevated(
                      text: "Hisob yaratish",
                      loading: registerProvider.isRegistering,
                      onPressed: () async {
                        final userData = RegisterUserData(
                          phone: phoneController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                        await registerProvider.registerUser(userData);
                        if (registerProvider.errorMessage == null) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainApp(
                                        isPregnancy: false,
                                        index: 0,
                                      )));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(registerProvider.errorMessage!)),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainApp(
                                        index: 0,
                                        isPregnancy: false,
                                      )));
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
