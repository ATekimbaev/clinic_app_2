import 'dart:math';

import 'package:clinic_app/core/app_consts.dart';
import 'package:clinic_app/presentation/screens/auth/activation_number_screen.dart';
import 'package:clinic_app/presentation/theme/app_fonts.dart';
import 'package:clinic_app/presentation/widgets/app_button.dart';
import 'package:clinic_app/presentation/widgets/custom_close_button.dart';
import 'package:clinic_app/presentation/widgets/custom_text_field.dart';
import 'package:clinic_app/presentation/widgets/shared_prefs_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomCloseButton(
          onPressed: () {},
        ),
        title: const Text(
          'Вход',
          style: AppFonts.w600s17,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Войти',
              style: AppFonts.w700s34,
            ),
            SizedBox(
              height: 49.h,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 11,
              ),
              child: Text(
                'Номер телефона',
                style: AppFonts.w400s15,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 11,
              ),
              child: CustomTextFeild(
                onChanged: (val) {
                  setState(() {});
                },
                controller: controller,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 11,
              ),
              child: Text(
                'На указанный вами номер придет однократное СМС-сообщение с кодом подтверждения.',
                style: AppFonts.w400s15,
              ),
            ),
            const Spacer(),
            AppButton(
              onPressed: controller.text.length < 9
                  ? null
                  : () async {
                      int code = Random().nextInt(8999) + 1000;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            code.toString(),
                          ),
                        ),
                      );
                      await SharedPrefsWidget.prefs.setString(
                        AppConsts.phoneNumber,
                        controller.text,
                      );

                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ActivationNumberScreen(
                            code: code,
                          ),
                        ),
                      );
                    },
              title: 'Далее',
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
