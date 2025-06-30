import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/models/course.dart'; // Make sure you have this model
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/app_static_lists.dart';
import 'package:my_portfolio/utils/app_strings.dart';
import 'package:my_portfolio/utils/app_styles.dart';
import 'package:visibility_detector/visibility_detector.dart';

class EducationSection extends StatefulWidget {
  const EducationSection({super.key});

  @override
  State<EducationSection> createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final primaryColor =
        isDarkMode
            ? AppColors.primaryBlueDark.withOpacity(.9)
            : AppColors.primaryBlueLight;
    final courses = AppStaticLists.courses;

    return VisibilityDetector(
      key: const Key('education-section'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.2 &&
            _controller.status != AnimationStatus.completed) {
          _controller.forward();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Center(
          child: Column(
            children: [
              FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Text(
                    AppStrings.sectionEducation,
                    style: AppStyles.s34W700.copyWith(
                      color:
                          isDarkMode
                              ? AppColors.primaryBlueDark
                              : AppColors.primaryBlueLight,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 800),
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.accentTeal),
                      color: isDarkMode ? AppColors.black : AppColors.lightCard,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color:
                              isDarkMode
                                  ? Colors.black.withOpacity(0.2)
                                  : Colors.black.withOpacity(0.05),
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 24,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: FaIcon(
                              FontAwesomeIcons.graduationCap,
                              color: AppColors.lightCard,
                              size: 22,
                            ),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              AppStrings.educationDegree,
                              // --- MODIFIED ---
                              style: AppStyles.s22W700.copyWith(
                                color:
                                    isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                              ),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              AppStrings.educationUniversity,
                              // --- MODIFIED ---
                              style: AppStyles.s16W400.copyWith(
                                height: 1.5,
                                color:
                                    isDarkMode
                                        ? AppColors.textDarkGrey
                                        : AppColors.textLightGrey,
                              ),
                            ),
                          ),
                          isThreeLine: true,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          AppStrings.courses,
                          // --- MODIFIED ---
                          style: AppStyles.s24W700.copyWith(
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ...courses.map(
                          (course) => CourseTile(
                            course: course,
                            isDarkMode: isDarkMode,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseTile extends StatelessWidget {
  final Course course;
  final bool isDarkMode;
  const CourseTile({super.key, required this.course, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 4, color: Theme.of(context).hintColor),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title,
                      // --- MODIFIED ---
                      style: AppStyles.s18W700.copyWith(
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${course.platform}, ${course.duration}',
                      style: AppStyles.s16W400.copyWith(
                        color:
                            isDarkMode
                                ? AppColors.textDarkGrey
                                : AppColors.textLightGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
