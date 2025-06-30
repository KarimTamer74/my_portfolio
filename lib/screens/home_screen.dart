import 'package:flutter/material.dart';
import 'package:my_portfolio/theme/change_theme.dart';
import 'package:my_portfolio/widgets/about_section.dart';
import 'package:my_portfolio/widgets/contact_section.dart';
import 'package:my_portfolio/widgets/custom_app_bar.dart';
import 'package:my_portfolio/widgets/education_section.dart';
import 'package:my_portfolio/widgets/experience_section.dart';
import 'package:my_portfolio/widgets/hero_section.dart';
import 'package:my_portfolio/widgets/projects_section.dart';
import 'package:my_portfolio/widgets/skills_section.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();

  final List<Widget> _sections = const [
    HeroSection(),
    AboutSection(),
    ExperienceSection(),
    SkillsSection(),
    ProjectsSection(),
    EducationSection(),
    ContactSection(),
  ];

  void _scrollToSection(Section section) {
    _itemScrollController.scrollTo(
      index: section.index,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }

  void _toggleTheme() {
    Provider.of<ChangeTheme>(context, listen: false).changeTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onNavigate: _scrollToSection,
        onToggleTheme: _toggleTheme,
      ),
      body: ScrollablePositionedList.builder(
        itemCount: _sections.length,
        itemScrollController: _itemScrollController,
        itemPositionsListener: _itemPositionsListener,
        itemBuilder: (context, index) {
          return _sections[index];
        },
      ),
    );
  }
}
