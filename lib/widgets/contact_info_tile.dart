import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String url;

  const ContactInfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      borderRadius: BorderRadius.circular(8),
      hoverColor: AppColors.primaryBlueLight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.accentTeal.withOpacity(.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: FaIcon(
                icon,
                color: AppColors.accentTeal.withOpacity(.9),
                size: 20,
              ),
            ),
            const SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.s18W700.copyWith(
                    color: isDark ? AppColors.white : AppColors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: AppStyles.s16W400.copyWith(
                    color:
                        isDark
                            ? AppColors.textDarkGrey
                            : AppColors.textLightGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
