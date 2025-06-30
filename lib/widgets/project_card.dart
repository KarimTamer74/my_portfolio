import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/screens/project_detail_screen.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/app_strings.dart';
import 'package:my_portfolio/utils/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final primaryColor =
        isDarkMode
            ? AppColors.primaryBlueDark.withOpacity(.9)
            : AppColors.primaryBlueLight;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectDetailScreen(project: widget.project),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12.0),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isDarkMode ? AppColors.black : AppColors.lightCard,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color:
                  _isHovered
                      ? AppColors.accentTeal.withOpacity(0.8)
                      : AppColors.accentTeal.withOpacity(0.4),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color:
                    _isHovered
                        ? theme.primaryColor.withOpacity(0.1)
                        : Colors.black.withOpacity(0.04),
                spreadRadius: _isHovered ? 4 : 1,
                blurRadius: _isHovered ? 12 : 8,
                offset: Offset(0, _isHovered ? 8 : 4),
              ),
            ],
          ),
          transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCarousel(theme),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: AppStyles.s20W700.copyWith(color: primaryColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.project.description,
                      style: AppStyles.s14W400.copyWith(
                        height: 1.5,
                        color:
                            isDarkMode
                                ? AppColors.textDarkGrey
                                : AppColors.textLightGrey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children:
                          widget.project.tags
                              .map(
                                (tag) => Chip(
                                  label: Text(tag),
                                  backgroundColor:
                                      isDarkMode
                                          ? AppColors.darkGrey
                                          : AppColors.lightGrey,
                                  labelStyle: AppStyles.s14W400.copyWith(
                                    color:
                                        isDarkMode
                                            ? AppColors.textDarkGrey
                                            : AppColors.textLightGrey,
                                  ),
                                  side: BorderSide.none,
                                ),
                              )
                              .toList(),
                    ),
                    const SizedBox(height: 18),
                    _buildLinks(theme, primaryColor),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarousel(ThemeData theme) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          itemCount: widget.project.imageUrls?.length ?? 1,
          itemBuilder: (context, index, realIndex) {
            return widget.project.imageUrls == null
                ? const Icon(Icons.image, size: 60, color: Colors.grey)
                : Image.asset(
                  widget.project.imageUrls![index],
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
          },
          options: CarouselOptions(
            height: 190,
            viewportFraction: 1.0,
            autoPlay: (_isHovered && widget.project.imageUrls != null),
            onPageChanged: (index, reason) {
              setState(() => _currentImageIndex = index);
            },
          ),
        ),
        if (widget.project.imageUrls != null)
          Positioned(
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  widget.project.imageUrls!.asMap().entries.map((entry) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.hintColor.withOpacity(
                          _currentImageIndex == entry.key ? 0.9 : 0.4,
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
      ],
    );
  }

  Widget _buildLinks(ThemeData theme, Color primaryColor) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => launchUrl(Uri.parse(widget.project.githubUrl)),
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.github,
                size: 16,
                color: AppColors.accentTeal,
              ),
              const SizedBox(width: 8),
              Text(
                AppStrings.viewOnGitHub,
                style: AppStyles.s16W700.copyWith(color: primaryColor),
              ),
            ],
          ),
        ),
        const Spacer(),
        if (widget.project.appUrl != null)
          GestureDetector(
            onTap: () => launchUrl(Uri.parse(widget.project.appUrl!)),
            child: Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.googleDrive,
                  size: 16,
                  color: AppColors.accentTeal,
                ),
                const SizedBox(width: 8),
                Text(
                  AppStrings.viewOnDrive,
                  style: AppStyles.s16W700.copyWith(color: primaryColor),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
