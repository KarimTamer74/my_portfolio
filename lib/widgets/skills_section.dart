// widgets/skills_section.dart
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
    final skills = [
      // ── Mobile Development ─────────────────────────────────────────
      Skill(name: 'Flutter', icon: FontAwesomeIcons.mobileScreen),
      Skill(name: 'Dart', icon: FontAwesomeIcons.code),
      Skill(name: 'Responsive UI', icon: FontAwesomeIcons.mobileScreenButton),
      Skill(name: 'Localization', icon: FontAwesomeIcons.language),

      // ── Architecture & State Management ────────────────────────────
      Skill(
        name: 'Clean Architecture',
        icon: FontAwesomeIcons.buildingColumns,
      ), // ✅ valid
      Skill(name: 'BLoC', icon: FontAwesomeIcons.diagramProject),
      Skill(name: 'MVVM', icon: FontAwesomeIcons.layerGroup),
      Skill(name: 'SOLID', icon: FontAwesomeIcons.cubes),
      Skill(name: 'OOP', icon: FontAwesomeIcons.cube),

      // ── Backend & APIs ─────────────────────────────────────────────
      Skill(name: 'REST API', icon: FontAwesomeIcons.server),
      Skill(name: 'Firebase', icon: FontAwesomeIcons.fire),
      Skill(name: 'Firestore', icon: FontAwesomeIcons.database),
      Skill(name: 'Supabase', icon: FontAwesomeIcons.bolt), // ✅ valid
      Skill(
        name: 'Payment Integration',
        icon: FontAwesomeIcons.creditCard,
      ), // ✅ valid
      // ── Databases & Local Storage ──────────────────────────────────
      Skill(
        name: 'Sqflite',
        icon: FontAwesomeIcons.hardDrive,
      ), // ✅ was: solidHardDrive (Pro only) → hardDrive
      Skill(name: 'Hive', icon: FontAwesomeIcons.boxArchive), // ✅ valid
      Skill(name: 'Shared Preferences', icon: FontAwesomeIcons.sliders),
      Skill(
        name: 'SQL',
        icon: FontAwesomeIcons.table,
      ), // ✅ was: tableColumns → table (simpler, free)
      // ── Notifications & Maps ───────────────────────────────────────
      Skill(
        name: 'Local Notifications',
        icon: FontAwesomeIcons.bell,
      ), // ✅ valid
      Skill(
        name: 'Push Notifications',
        icon: FontAwesomeIcons.solidBell,
      ), // ✅ was: solidBell (Solid style prefix)
      Skill(name: 'Google Maps', icon: FontAwesomeIcons.locationDot),

      // ── DevOps & Version Control ───────────────────────────────────
      Skill(name: 'Git & GitHub', icon: FontAwesomeIcons.gitAlt),
      Skill(name: 'Fastlane', icon: FontAwesomeIcons.rocket),
      Skill(name: 'Shorebird', icon: FontAwesomeIcons.cloudArrowUp),

      // ── Core CS ────────────────────────────────────────────────────
      Skill(name: 'Data Structures', icon: FontAwesomeIcons.sitemap),
      Skill(name: 'Clean Code', icon: FontAwesomeIcons.fileCode),
      Skill(name: 'Problem Solving', icon: FontAwesomeIcons.puzzlePiece),
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
