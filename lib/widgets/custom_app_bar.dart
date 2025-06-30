import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/app_styles.dart';

// Define an enum for sections to make it type-safe
enum Section { home, about,experience, skills, projects, education, contact }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(Section) onNavigate;
  final VoidCallback onToggleTheme;

  const CustomAppBar({
    super.key,
    required this.onNavigate,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = MediaQuery.of(context).size.width > 800;
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return AppBar(
      elevation: 1.0,
      actions:
          isWideScreen
              ? [
                NavButton(
                  title: 'Home',
                  onPressed: () => onNavigate(Section.home),
                ),
                NavButton(
                  title: 'About',
                  onPressed: () => onNavigate(Section.about),
                ),
                NavButton(
                  title: 'Experience',
                  onPressed: () => onNavigate(Section.experience),
                ),
                NavButton(
                  title: 'Skills',
                  onPressed: () => onNavigate(Section.skills),
                ),
                NavButton(
                  title: 'Projects',
                  onPressed: () => onNavigate(Section.projects),
                ),
                NavButton(
                  title: 'Education',
                  onPressed: () => onNavigate(Section.education),
                ),
                NavButton(
                  title: 'Contact',
                  onPressed: () => onNavigate(Section.contact),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: IconButton(
                      icon: FaIcon(
                        isDarkMode
                            ? FontAwesomeIcons.solidMoon
                            : FontAwesomeIcons.sun,
                        color:
                            isDarkMode
                                ? AppColors.accentTeal
                                : AppColors.primaryBlueLight,
                      ),
                      onPressed: onToggleTheme,
                      tooltip: 'Toggle Theme',
                    ),
                  ),
                ),
              ]
              : [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.brightness_6_outlined,
                      color: AppColors.accentTeal,
                    ),
                    onPressed: onToggleTheme,
                    tooltip: 'Toggle Theme',
                  ),
                ),
                // You might want a PopupMenuButton for mobile navigation
              ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class NavButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;

  const NavButton({super.key, required this.title, required this.onPressed});

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    // The primary color will adapt to the current theme
    final primaryColor =
        isDarkMode ? AppColors.primaryBlueDark : AppColors.accentTeal;
    // The default text color will also adapt
    final defaultTextColor = isDarkMode ? AppColors.white : AppColors.black;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            // --- NEW: Background color fades in on hover ---
            color: isDarkMode ? AppColors.darkBg : Color(0xffF1F1F8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.title,
            style: AppStyles.s16W600.copyWith(
              // --- NEW: Text color changes on hover ---
              color: _isHovered ? primaryColor : defaultTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
