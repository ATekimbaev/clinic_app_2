import 'package:clinic_app/presentation/theme/app_colors.dart';
import 'package:clinic_app/presentation/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class CreateOrderScreensTextField extends StatelessWidget {
  const CreateOrderScreensTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.title,
  });

  final String title;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.w400s15,
        ),
        TextField(
          style: AppFonts.w400s17.copyWith(
            color: AppColors.black,
          ),
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppFonts.w400s17,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.black,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
