// widgets/experience_section.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/models/job.dart';
import 'package:my_portfolio/utils/app_assets.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/app_strings.dart';
import 'package:my_portfolio/utils/app_styles.dart';
import 'package:my_portfolio/widgets/expeience_card.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
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

    final jobs = [
      Job(
        position: 'Flutter Instructor',
        company: 'National Telecommunication Institute (NTI)',
        duration: 'Oct 2025 - Present',
        responsibilities: [
          'Delivered 90+ hours of hands-on Flutter training covering Dart, UI, BLoC, REST APIs, and MVVM.',
          'Mentored trainees to build complete real-world Flutter applications.',
          'Focused on clean code, scalable architecture, and best practices.',
        ],
      ),
      Job(
        position: 'Freelance Flutter Developer',
        company: 'Mothooq-App',
        duration: 'March 2025 (2 weeks)',
        responsibilities: [
          'Developed UI and app logic for a used car marketplace.',
          'Built responsive layouts and used BLoC for state management.',
          'Integrated Firebase Authentication with Google Sign-In.',
          'Delivered MVP in 2 weeks with plans for future updates.',
        ],
      ),
      // Job(
      //   position: 'Trainee Flutter Developer',
      //   company: 'National Telecommunication Institute (NTI)',
      //   duration: 'Feb 2025 - Mar 2025',
      //   responsibilities: [
      //     'Completed Flutter track covering Dart, REST APIs, and BLoC.',
      //     'Built several apps during collaborative training sessions.',
      //     'Gained hands-on experience with real-world team workflows.',
      //   ],
      // ),
    ];

    return VisibilityDetector(
      key: const Key('experience-section'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.2) {
          _controller.forward();
        } else {
          _controller.reset();
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
            decoration: BoxDecoration(
              color:
                  isDarkMode
                      ? AppColors.black.withOpacity(0.7)
                      : AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color:
                      isDarkMode
                          ? Colors.black26
                          : Colors.grey.withOpacity(0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  AppStrings.sectionExperience,
                  style: AppStyles.s34W700.copyWith(
                    color:
                        isDarkMode
                            ? AppColors.primaryBlueDark
                            : AppColors.primaryBlueLight,
                  ),
                ),
                const SizedBox(height: 24),
                isMobile
                    ? Column(
                      children: [
                        Lottie.asset(
                          AppAssets.experienceLottie,
                          height: 250,
                          repeat: true,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 24),
                        ListView.separated(
                          itemCount: jobs.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder:
                              (context, index) => const SizedBox(height: 30),
                          itemBuilder: (context, index) {
                            final animationInterval = index * 0.2;
                            final fade = Tween(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                parent: _controller,
                                curve: Interval(
                                  animationInterval,
                                  1.0,
                                  curve: Curves.easeOut,
                                ),
                              ),
                            );
                            final slide = Tween<Offset>(
                              begin: const Offset(-0.4, 0),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: _controller,
                                curve: Interval(
                                  animationInterval,
                                  1.0,
                                  curve: Curves.easeOut,
                                ),
                              ),
                            );
                            return FadeTransition(
                              opacity: fade,
                              child: SlideTransition(
                                position: slide,
                                child: ExperienceCard(job: jobs[index]),
                              ),
                            );
                          },
                        ),
                      ],
                    )
                    : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 800),
                            child: ListView.separated(
                              itemCount: jobs.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder:
                                  (context, index) =>
                                      const SizedBox(height: 30),
                              itemBuilder: (context, index) {
                                final animationInterval = index * 0.2;
                                final fade = Tween(
                                  begin: 0.0,
                                  end: 1.0,
                                ).animate(
                                  CurvedAnimation(
                                    parent: _controller,
                                    curve: Interval(
                                      animationInterval,
                                      1.0,
                                      curve: Curves.easeOut,
                                    ),
                                  ),
                                );
                                final slide = Tween<Offset>(
                                  begin: const Offset(-0.4, 0),
                                  end: Offset.zero,
                                ).animate(
                                  CurvedAnimation(
                                    parent: _controller,
                                    curve: Interval(
                                      animationInterval,
                                      1.0,
                                      curve: Curves.easeOut,
                                    ),
                                  ),
                                );
                                return FadeTransition(
                                  opacity: fade,
                                  child: SlideTransition(
                                    position: slide,
                                    child: ExperienceCard(job: jobs[index]),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Lottie.asset(
                              AppAssets.experienceLottie,
                              fit: BoxFit.contain,
                              repeat: true,
                            ),
                          ),
                        ),
                      ],
                    ),
              ],
            ),
          );
        },
      ),
    );
  }
}
