import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/app_static_lists.dart';
import 'package:my_portfolio/utils/app_strings.dart';
import 'package:my_portfolio/utils/app_styles.dart';
import 'package:my_portfolio/widgets/project_card.dart'; // Ensure path is correct

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isDarkMode = theme.brightness == Brightness.dark;
    final double cardWidth;
    final EdgeInsets padding;

    if (screenWidth > 1200) {
      cardWidth = (screenWidth - 160 - 60) / 3;
      padding = const EdgeInsets.symmetric(horizontal: 80);
    } else if (screenWidth > 800) {
      cardWidth = (screenWidth - 80 - 30) / 2;
      padding = const EdgeInsets.symmetric(horizontal: 40);
    } else {
      cardWidth = screenWidth - 40;
      padding = const EdgeInsets.symmetric(horizontal: 20);
    }
    final projects = AppStaticLists.projects;
    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: Column(
        children: [
          Text(
            AppStrings.sectionProjects,
            style: AppStyles.s34W700.copyWith(
              color:
                  isDarkMode
                      ? AppColors.primaryBlueDark
                      : AppColors.primaryBlueLight,
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: padding,
            child: Wrap(
              spacing: 30,
              runSpacing: 30,
              alignment: WrapAlignment.center,
              children:
                  projects.map((project) {
                    return SizedBox(
                      width: cardWidth,
                      child: ProjectCard(project: project),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
