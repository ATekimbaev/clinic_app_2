import 'package:clinic_app/data/models/doctors_model.dart';
import 'package:clinic_app/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsInfoWidget extends StatelessWidget {
  const DoctorsInfoWidget({
    super.key,
    required this.model,
    required this.onTap,
  });

  final DoctorsModel model;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 335.w,
          height: 76.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  model.image,
                ),
                radius: 27,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.specialty,
                    style: const TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 15,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                  Text(
                    model.name,
                    style: const TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 17,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star_border,
                    size: 24,
                    color: Color(0xff757575),
                  ),
                  Text(
                    model.raitng.toString(),
                    style: const TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 15,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.message_outlined,
                    size: 24,
                    color: Color(0xff757575),
                  ),
                  Text(
                    model.feedback.length.toString(),
                    style: const TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 15,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
