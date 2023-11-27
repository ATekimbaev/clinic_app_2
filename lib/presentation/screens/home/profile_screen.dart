import 'dart:io';

import 'package:clinic_app/core/app_consts.dart';
import 'package:clinic_app/presentation/theme/app_colors.dart';
import 'package:clinic_app/presentation/theme/app_fonts.dart';
import 'package:clinic_app/presentation/widgets/settings_button.dart';
import 'package:clinic_app/presentation/widgets/shared_prefs_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SettigsButton(
            onPressed: () {},
          ),
        ],
        centerTitle: false,
        title: Text(
          'Мой профиль',
          style: AppFonts.w700s34.copyWith(
            color: AppColors.black,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: imagePath != null
                        ? FileImage(
                            File(
                              imagePath!,
                            ),
                          )
                        : null,
                    radius: 50,
                    backgroundColor: AppColors.lightBlue,
                    child: imagePath != null
                        ? null
                        : Text(
                            '${SharedPrefsWidget.prefs.getString(AppConsts.name)?[0] ?? ''}${SharedPrefsWidget.prefs.getString(AppConsts.sureName)?[0] ?? ''}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16.r,
                      backgroundColor: AppColors.buttonColor,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            openDialog();
                          },
                          child: const Icon(
                            Icons.camera_alt,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                '${SharedPrefsWidget.prefs.getString(AppConsts.name)} ${SharedPrefsWidget.prefs.getString(AppConsts.sureName)}',
                style: AppFonts.w500s22,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                formatNumber(),
                style: AppFonts.w500s22,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: 400,
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  pickProfileImage(
                    source: ImageSource.camera,
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  'Camera',
                  style: AppFonts.w700s34,
                ),
              ),
              TextButton(
                onPressed: () {
                  pickProfileImage(
                    source: ImageSource.gallery,
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  'Gallery',
                  style: AppFonts.w700s34,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatNumber() {
    String result = '';

    String phone =
        SharedPrefsWidget.prefs.getString(AppConsts.phoneNumber) ?? '';

    result =
        '+996 ${phone.substring(0, 3)} ${phone.substring(3, 5)} ${phone.substring(5, 7)}  ${phone.substring(7, 9)}';

    return result;
  }

  Future<void> pickProfileImage({required ImageSource source}) async {
    final ImagePicker imagePicker = ImagePicker();
    try {
      XFile? file = await imagePicker.pickImage(source: source);
      if (file != null) {
        imagePath = file.path;
        setState(() {});
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
