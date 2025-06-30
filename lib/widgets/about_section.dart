import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/app_constants.dart';
import 'package:my_portfolio/utils/app_strings.dart';
import 'package:my_portfolio/utils/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 600;
    final descriptionStyle =
        isSmallScreen ? AppStyles.s16W600 : AppStyles.s18W600;
    final buttonTextStyle =
        isSmallScreen ? AppStyles.s14W700 : AppStyles.s16W700;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: isDarkMode ? AppColors.darkBg : AppColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          margin: EdgeInsets.symmetric(horizontal: isSmallScreen ? 10 : 20),
          padding: EdgeInsets.symmetric(
            vertical: isSmallScreen ? 20 : 20,
            horizontal: isSmallScreen ? 20 : 40,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),

              child: Column(
                children: [
                  Text(
                    AppStrings.sectionAboutMe,
                    style: AppStyles.s34W700.copyWith(
                      color:
                          isDarkMode
                              ? AppColors.primaryBlueDark
                              : AppColors.primaryBlueLight,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppStrings.aboutMeSummary,
                    textAlign: TextAlign.center,
                    style: descriptionStyle.copyWith(
                      height: 1.6,
                      color:
                          isDarkMode
                              ? AppColors.textDarkGrey
                              : AppColors.textLightGrey,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    icon: Icon(
                      Icons.download_outlined,
                      color:
                          AppColors
                              .textSecondary, // Always white on a primary button
                      size: isSmallScreen ? 20 : 22,
                    ),
                    label: Text(
                      AppStrings.downloadResume,
                      style: buttonTextStyle.copyWith(
                        color: AppColors.textSecondary, // Always white
                      ),
                    ),
                    onPressed: () {
                      final Uri cvUrl = Uri.parse(AppConstants.resumeLink);
                      launchUrl(cvUrl, mode: LaunchMode.externalApplication);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlueLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? 32 : 40,
                        vertical: isSmallScreen ? 18 : 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double screenWidth = constraints.maxWidth;
              double indent =
                  screenWidth > 1000
                      ? 200
                      : screenWidth > 600
                      ? 100
                      : 40;

              double endIndent =
                  screenWidth > 1000
                      ? 200
                      : screenWidth > 600
                      ? 100
                      : 40;

              return Divider(
                color: AppColors.accentTeal,
                thickness: 1.5,
                indent: indent,
                endIndent: endIndent,
              );
            },
          ),
        ),
      ],
    );
  }
}
