import 'package:flutter/material.dart';
import 'package:my_portfolio/models/skill.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/app_styles.dart';

class SkillCard extends StatefulWidget {
  final Skill skill;

  const SkillCard({super.key, required this.skill});

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final primaryColor =
        isDarkMode
            ? AppColors.primaryBlueDark.withOpacity(.9)
            : AppColors.primaryBlueLight;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          // --- MODIFIED: Using semantic colors from AppColors ---
          color: isDarkMode ? AppColors.black : AppColors.lightCard,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: AppColors.accentTeal, width: .5),
          boxShadow: [
            BoxShadow(
              color:
                  (isDarkMode
                      ? Colors.black.withOpacity(0.2)
                      : Colors.black.withOpacity(0.05)),
              spreadRadius: _isHovered ? 4 : 1,
              blurRadius: 10,
              offset: Offset(0, _isHovered ? 8 : 4),
            ),
          ],
        ),
        transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.skill.icon != null)
              Icon(
                widget.skill.icon,
                color: _isHovered ? primaryColor : AppColors.accentTeal,
                size: 32,
              ),
            if (widget.skill.icon != null) const SizedBox(height: 16),
            Text(
              widget.skill.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.s17W700.copyWith(color: primaryColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
