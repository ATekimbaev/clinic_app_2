import 'package:clinic_app/presentation/theme/app_fonts.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class MyCihp extends StatelessWidget {
  const MyCihp({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onSelected,
  });

  final String title;
  final bool isSelected;
  final Function(bool) onSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: ChoiceChip(
        onSelected: onSelected,
        showCheckmark: false,
        avatarBorder: RoundedRectangleBorder(
          side: const BorderSide(
            color: AppColors.black,
          ),
          borderRadius: BorderRadius.circular(
            4,
          ),
        ),
        backgroundColor: AppColors.white,
        selectedColor: AppColors.buttonColor,
        label: Text(
          title,
          style: AppFonts.w600s15.copyWith(
            color: isSelected ? AppColors.white : AppColors.fontsColor,
          ),
        ),
        selected: isSelected,
      ),
    );
  }
}
