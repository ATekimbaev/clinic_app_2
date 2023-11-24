import 'package:clinic_app/presentation/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeInfoRow extends StatelessWidget {
  const WelcomeInfoRow({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          height: 32.h,
        ),
        SizedBox(
          width: 18.w,
        ),
        Flexible(
          child: Text(
            title,
            style: AppFonts.w400s15,
          ),
        ),
      ],
    );
  }
}
