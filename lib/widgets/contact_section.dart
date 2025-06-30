import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/app_strings.dart';
import 'package:my_portfolio/utils/app_styles.dart';
import 'package:my_portfolio/widgets/get_in_touch.dart';
import 'package:my_portfolio/widgets/send_message_form.dart';
import 'package:visibility_detector/visibility_detector.dart';

// Custom ScrollBehavior to hide the scrollbar
class NoScrollbarBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
  };
}

class ContactSection extends StatefulWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection>
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
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3), // from bottom to top
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

    return VisibilityDetector(
      key: const Key('contact-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) {
          _controller.forward();
        } else {
          _controller.reset();
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth > 850;

          return Container(
            color: isDarkMode ? AppColors.black : Colors.white,
            padding: EdgeInsets.symmetric(
              vertical: isWide ? 80 : 60,
              horizontal: isWide ? 100 : 25,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      children: [
                        Text(
                          AppStrings.sectionContact,
                          style: AppStyles.s34W700.copyWith(
                            color:
                                isDarkMode
                                    ? AppColors.primaryBlueDark
                                    : AppColors.primaryBlueLight,
                          ),
                        ),

                        const SizedBox(height: 60),
                        isWide
                            ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Expanded(flex: 5, child: GetInTouch()),
                                SizedBox(width: isWide ? 80 : 50),
                                const Expanded(
                                  flex: 6,
                                  child: SendMessageForm(),
                                ),
                              ],
                            )
                            : Column(
                              children: const [
                                GetInTouch(),
                                SizedBox(height: 60),
                                SendMessageForm(),
                              ],
                            ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
