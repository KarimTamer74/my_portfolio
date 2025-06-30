import 'package:flutter/material.dart';
import 'package:my_portfolio/models/job.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/app_styles.dart';

class ExperienceCard extends StatelessWidget {
  final Job job;
  const ExperienceCard({required this.job});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color:
            isDarkMode
                ? AppColors.primaryBlueDark.withOpacity(0.1)
                : AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color:
              isDarkMode
                  ? AppColors.accentTeal.withOpacity(0.6)
                  : AppColors.accentTeal.withOpacity(0.8),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color:
                isDarkMode
                    ? Colors.black.withOpacity(0.3)
                    : Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.primaryColor,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 2,
                    color: theme.primaryColor.withOpacity(0.8),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.position,
                    style: AppStyles.s22W700.copyWith(
                      color:
                          isDarkMode
                              ? AppColors.textSecondary
                              : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${job.company}  •  ${job.duration}',
                    style: AppStyles.s16W500.copyWith(color: theme.hintColor),
                  ),
                  const SizedBox(height: 16),
                  ...job.responsibilities.map(
                    (responsibility) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 6.0,
                              right: 12.0,
                            ),
                            child: Icon(
                              Icons.arrow_right,
                              size: 16,
                              color: theme.primaryColor,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              responsibility,
                              style: AppStyles.s16W400.copyWith(
                                height: 1.5,
                                color:
                                    isDarkMode
                                        ? AppColors.textDarkGrey
                                        : AppColors.textLightGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
