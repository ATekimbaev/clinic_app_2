import 'package:clinic_app/data/app_data.dart';
import 'package:clinic_app/presentation/screens/auth/login_screen.dart';
import 'package:clinic_app/presentation/theme/app_fonts.dart';
import 'package:clinic_app/presentation/widgets/settings_button.dart';
import 'package:clinic_app/presentation/widgets/welcome_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Профиль',
          style: AppFonts.w600s17,
        ),
        actions: [
          SettigsButton(
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Зачем нужен профиль?',
              style: AppFonts.w500s22,
            ),
            SizedBox(
              height: 25.h,
            ),
            Column(
              children: AppData.data
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: WelcomeInfoRow(
                        image: e.image,
                        title: e.title,
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 5.h,
            ),
            AppButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              title: 'Войти',
            ),
          ],
        ),
      ),
    );
  }
}
