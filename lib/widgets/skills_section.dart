import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/models/skill.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/app_strings.dart';
import 'package:my_portfolio/utils/app_styles.dart';
import 'package:my_portfolio/widgets/skill_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    log('screenWidth: $screenWidth, isDarkMode: $isDarkMode');
    final int crossAxisCount;
    final double childAspectRatio;
    final EdgeInsets padding;
    if (screenWidth >= 1500) {
      crossAxisCount = 8;
      padding = const EdgeInsets.symmetric(horizontal: 120);
    } else if (screenWidth >= 1200) {
      crossAxisCount = 7;
      padding = const EdgeInsets.symmetric(horizontal: 80);
    } else if (screenWidth >= 915) {
      crossAxisCount = 5;
      padding = const EdgeInsets.symmetric(horizontal: 60);
    } else if (screenWidth >= 650) {
      crossAxisCount = 4;
      padding = const EdgeInsets.symmetric(horizontal: 40);
    } else {
      crossAxisCount = 3;
      padding = const EdgeInsets.symmetric(horizontal: 20);
    }
    childAspectRatio = 1.2;

    final List<Skill> skills = [
      Skill(name: AppStrings.skillFlutter, icon: FontAwesomeIcons.mobileScreen),
      Skill(name: AppStrings.skillDart, icon: FontAwesomeIcons.code),
      Skill(name: AppStrings.skillBloc, icon: FontAwesomeIcons.diagramProject),
      Skill(name: AppStrings.skillMVVM, icon: FontAwesomeIcons.layerGroup),
      Skill(name: AppStrings.skillRestApi, icon: FontAwesomeIcons.server),
      Skill(name: AppStrings.skillFirebase, icon: FontAwesomeIcons.fire),
      Skill(name: AppStrings.skillFirestore, icon: FontAwesomeIcons.database),
      Skill(
        name: AppStrings.skillSqflite,
        icon: FontAwesomeIcons.solidHardDrive,
      ),
      Skill(
        name: AppStrings.skillShorebird,
        icon: FontAwesomeIcons.cloudArrowUp,
      ),
      Skill(name: AppStrings.skillFastlane, icon: FontAwesomeIcons.rocket),
      Skill(
        name: AppStrings.skillResponsiveUi,
        icon: FontAwesomeIcons.mobileScreenButton,
      ),
      Skill(
        name: AppStrings.skillLocalization,
        icon: FontAwesomeIcons.language,
      ),
      Skill(name: AppStrings.skillGitAndGitHub, icon: FontAwesomeIcons.gitAlt),
      Skill(name: AppStrings.skillSQL, icon: FontAwesomeIcons.database),
      Skill(name: AppStrings.skillOop, icon: FontAwesomeIcons.cube),
      Skill(name: AppStrings.skillSolid, icon: FontAwesomeIcons.cubes),
    ];

    return Container(
      width: double.infinity,
      color: theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Text(
            AppStrings.sectionSkills,
            style: AppStyles.s34W700.copyWith(
              color:
                  isDarkMode
                      ? AppColors.primaryBlueDark
                      : AppColors.primaryBlueLight,
            ),
          ),

          const SizedBox(height: 35),
          Padding(
            padding: padding,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: childAspectRatio,
              ),
              itemCount: skills.length,
              itemBuilder: (context, index) {
                return SkillCard(skill: skills[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
