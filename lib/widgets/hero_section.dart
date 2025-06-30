import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/utils/app_assets.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/app_constants.dart';
import 'package:my_portfolio/utils/app_strings.dart';
import 'package:my_portfolio/utils/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 700;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: isSmallScreen ? 40 : 70,
          horizontal: isSmallScreen ? 20 : 40,
        ),
        margin: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: AppColors.primaryBlueLight,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child:
                isSmallScreen
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildContent(context, isSmallScreen),
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildTextContent(isSmallScreen: false),
                          ),
                        ),
                        const SizedBox(width: 60),
                        Expanded(flex: 2, child: _buildProfileImage()),
                      ],
                    ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildContent(BuildContext context, bool isSmallScreen) {
    return [
      if (isSmallScreen) _buildProfileImage(isSmall: true),
      if (isSmallScreen) const SizedBox(height: 40),
      ..._buildTextContent(isSmallScreen: isSmallScreen),
    ];
  }

  List<Widget> _buildTextContent({bool isSmallScreen = false}) {
    final buttonTextStyle =
        isSmallScreen ? AppStyles.s14W700 : AppStyles.s16W700;

    return [
      Text(
        'Karim Tamer',
        style: isSmallScreen ? AppStyles.s32W700White : AppStyles.s48W700White,
        textAlign: isSmallScreen ? TextAlign.center : TextAlign.start,
      ),
      const SizedBox(height: 16),
      Text(
        'Junior Flutter Developer',
        style: isSmallScreen ? AppStyles.s20W400White : AppStyles.s24W600White,
        textAlign: isSmallScreen ? TextAlign.center : TextAlign.start,
      ),
      const SizedBox(height: 24),
      Text(
        'Building responsive and user-friendly mobile apps with Flutter and Dart.',
        style:
            isSmallScreen
                ? AppStyles.s16W500White.copyWith(height: 1.5)
                : AppStyles.s20W400White.copyWith(height: 1.5),
        textAlign: isSmallScreen ? TextAlign.center : TextAlign.start,
      ),
      const SizedBox(height: 40),
      Row(
        mainAxisAlignment:
            isSmallScreen ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          ElevatedButton.icon(
            onPressed:
                () => launchUrl(Uri.parse('https://github.com/KarimTamer74')),
            icon: const FaIcon(
              FontAwesomeIcons.github,
              color: AppColors.textPrimary,
              size: 18,
            ),
            label: Text(
              'View GitHub',
              style: buttonTextStyle.copyWith(color: AppColors.textPrimary),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accentTeal,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton.icon(
            onPressed:
                () => launchUrl(
                  Uri.parse(AppConstants.linkedInLink),
                ),
            icon: const FaIcon(
              FontAwesomeIcons.linkedinIn,
              color: AppColors.primaryBlueLight,
              size: 18,
            ),
            label: Text(
              AppStrings.linkedIn,
              style: buttonTextStyle.copyWith(
                color: AppColors.primaryBlueLight,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    ];
  }

  Widget _buildProfileImage({bool isSmall = false}) {
    return Container(
      width: isSmall ? 200 : 280,
      height: isSmall ? 200 : 280,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.8), width: 6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
        image: const DecorationImage(
          image: AssetImage(AppAssets.profileImage),
          fit: BoxFit.fitHeight, // Using cover is better for circles
        ),
      ),
    );
  }
}
