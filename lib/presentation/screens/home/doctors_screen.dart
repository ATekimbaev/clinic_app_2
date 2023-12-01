import 'package:clinic_app/presentation/theme/app_colors.dart';
import 'package:clinic_app/presentation/theme/app_fonts.dart';
import 'package:clinic_app/presentation/widgets/search_text_field.dart';
import 'package:clinic_app/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  final TextEditingController controller = TextEditingController();

  int selctedIndex = 0;

  List<String> speciality = [
    'Артимологи',
    'Кардиологи',
    'Кардиохирурги',
    'Артимологи',
    'Кардиологи',
    'Кардиохирурги',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Доктора',
                    style: AppFonts.w700s34,
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    AppSvgs.bell,
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SearchTextFeild(
                    controller: controller,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      controller.clear();
                    },
                    child: const Text(
                      'Очистить',
                      style: AppFonts.w600s14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: ListView.builder(
                  itemBuilder: (contex, index) => MyCihp(
                    onSelected: (val) {
                      selctedIndex = index;
                      setState(() {});
                    },
                    isSelected: selctedIndex == index,
                    title: speciality[index],
                  ),
                  itemCount: speciality.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
