import 'package:clinic_app/presentation/theme/app_colors.dart';
import 'package:clinic_app/presentation/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextFeild extends StatelessWidget {
  const SearchTextFeild({
    super.key,
    required this.controller,
    this.onChanged,
  });

  final TextEditingController controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      width: 266.w,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(11),
          prefixIcon: const Icon(
            Icons.search,
          ),
          hintText: 'Поиск врача',
          hintStyle: AppFonts.w400s17,
          filled: true,
          fillColor: AppColors.textfieldColorWithOpacity,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.textfieldColorWithOpacity,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
