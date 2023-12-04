import 'package:clinic_app/data/models/doctors_model.dart';
import 'package:clinic_app/presentation/theme/app_colors.dart';
import 'package:clinic_app/presentation/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:star_rating/star_rating.dart';

class DoctorsInfoScreen extends StatefulWidget {
  const DoctorsInfoScreen({
    super.key,
    required this.model,
  });

  final DoctorsModel model;

  @override
  State<DoctorsInfoScreen> createState() => _DoctorsInfoScreenState();
}

class _DoctorsInfoScreenState extends State<DoctorsInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.model.name,
          style: AppFonts.w600s17,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50.r,
              backgroundImage: NetworkImage(widget.model.image),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              widget.model.name,
              style: AppFonts.w500s22,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.model.specialty,
              style: AppFonts.w400s17.copyWith(
                color: AppColors.fontsColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StarRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                  onRaitingTap: (val) {
                    widget.model.raitng = val;
                    setState(() {});
                  },
                  rating: widget.model.raitng,
                  color: const Color(0xffFC9E4F),
                  starSize: 24,
                  length: 5,
                  between: 24,
                ),
                Text(
                  widget.model.raitng.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    height: 0.07,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.model.feedback.length,
                itemBuilder: (context, index) => ListTile(
                  titleAlignment: ListTileTitleAlignment.top,
                  subtitle: Text(
                    widget.model.feedback[index].text,
                  ),
                  title: Text(
                    widget.model.feedback[index].name,
                    style: AppFonts.w600s18.copyWith(
                      color: AppColors.fontsColor,
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 20.r,
                    backgroundImage: NetworkImage(
                      widget.model.feedback[index].image,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
