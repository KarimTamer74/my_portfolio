import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart'; // --- NEW: Import for custom scroll behavior
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/theme/change_theme.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// --- NEW: Custom ScrollBehavior to hide the scrollbar ---
class NoScrollbarBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
  };
}

class ProjectDetailScreen extends StatefulWidget {
  final Project project;

  const ProjectDetailScreen({super.key, required this.project});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  bool _isGalleryHovered = false;
  int _currentImageIndex = 0;
  void _toggleTheme() {
    Provider.of<ChangeTheme>(context, listen: false).changeTheme();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: IconButton(
              icon: FaIcon(
                isDarkMode ? FontAwesomeIcons.solidMoon : FontAwesomeIcons.sun,
                color:
                    isDarkMode
                        ? AppColors.accentTeal
                        : AppColors.primaryBlueLight,
              ),
              onPressed: () => _toggleTheme(),
              tooltip: 'Toggle Theme',
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          tooltip: 'Back',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: 32.0,
              horizontal: 40.0,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  return _buildWideLayout(context, theme, isDarkMode);
                } else {
                  return _buildNarrowLayout(context, theme, isDarkMode);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWideLayout(
    BuildContext context,
    ThemeData theme,
    bool isDarkMode,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: _buildImageGallery(context)),
        const SizedBox(width: 50),
        Expanded(flex: 2, child: _buildProjectInfo(context, theme, isDarkMode)),
      ],
    );
  }

  Widget _buildNarrowLayout(
    BuildContext context,
    ThemeData theme,
    bool isDarkMode,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageGallery(context),
        const SizedBox(height: 32),
        _buildProjectInfo(context, theme, isDarkMode),
      ],
    );
  }

  Widget _buildImageGallery(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => _isGalleryHovered = true),
          onExit: (_) => setState(() => _isGalleryHovered = false),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: widget.project.imageUrls?.length ?? 1,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child:
                          widget.project.imageUrls == null
                              ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image,
                                    size: 100,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'No images available',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge?.copyWith(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              )
                              : Image.asset(
                                widget.project.imageUrls![index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                    ),
                  );
                },
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  enlargeCenterPage: true,
                  autoPlay: widget.project.imageUrls != null,
                  autoPlayInterval: const Duration(seconds: 6),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity:
                    _isGalleryHovered &&
                            (widget.project.imageUrls?.length ?? 0) > 1
                        ? 1.0
                        : 0.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildArrowButton(
                        onPressed: () => _carouselController.previousPage(),
                        icon: Icons.arrow_back_ios_new,
                      ),
                      _buildArrowButton(
                        onPressed: () => _carouselController.nextPage(),
                        icon: Icons.arrow_forward_ios,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (widget.project.imageUrls != null) ...[
          const SizedBox(height: 12),
          _buildCarouselIndicator(),
        ],
      ],
    );
  }

  Widget _buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          widget.project.imageUrls!.asMap().entries.map((entry) {
            int index = entry.key;
            return GestureDetector(
              onTap: () => _carouselController.animateToPage(index),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 4.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).hintColor).withOpacity(
                    _currentImageIndex == index ? 0.9 : 0.3,
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildArrowButton({
    required VoidCallback onPressed,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white, size: 20),
        splashRadius: 25,
      ),
    );
  }

  Widget _buildProjectInfo(
    BuildContext context,
    ThemeData theme,
    bool isDarkMode,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.project.title,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          widget.project.longDescription,
          style: theme.textTheme.bodyLarge?.copyWith(
            height: 1.6,
            fontSize: 16,
            color: isDarkMode ? Colors.grey[300] : Colors.grey[800],
          ),
        ),
        const SizedBox(height: 24),
        Text('Technologies Used', style: theme.textTheme.titleLarge),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children:
              widget.project.tags
                  .map(
                    (tag) => Chip(
                      label: Text(tag),
                      backgroundColor:
                          isDarkMode ? AppColors.darkGrey : AppColors.lightGrey,
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
        const SizedBox(height: 32),
        _buildLinkButton(
          theme: theme,
          isDarkMode: isDarkMode,
          text: 'View on GitHub',
          textColor: isDarkMode ? Colors.white : Colors.black,
          icon: FontAwesomeIcons.github,
          iconColor: isDarkMode ? Colors.white : Colors.black,
          url: widget.project.githubUrl,
          backgroundColor:
              isDarkMode ? AppColors.darkGrey : AppColors.lightGrey,
        ),
        if (widget.project.appUrl != null) ...[
          const SizedBox(height: 16),
          _buildLinkButton(
            theme: theme,
            isDarkMode: isDarkMode,

            text: 'Explore the App',
            textColor: Colors.white,
            icon: FontAwesomeIcons.arrowUpRightFromSquare,
            iconColor: Colors.white,
            url: widget.project.appUrl!,
            backgroundColor: AppColors.primaryBlueLight,
          ),
        ],
        // if (widget.project.driveUrl == null) ...[
        //   const SizedBox(height: 16),
        //   _buildLinkButton(
        //     theme: theme,
        //     isDarkMode: isDarkMode,
        //     text: 'View on Drive',
        //     textColor: Colors.white,
        //     icon: FontAwesomeIcons.googleDrive,
        //     url: widget.project.driveUrl!,
        //     backgroundColor: const Color(0xFF1AA260),
        //   ),
        // ],
      ],
    );
  }

  Widget _buildLinkButton({
    required ThemeData theme,
    required bool isDarkMode,
    required String text,
    required Color textColor,
    required Color iconColor,
    required IconData icon,
    required String url,
    required Color backgroundColor,
  }) {
    final isDarkMode = theme.brightness == Brightness.dark;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => launchUrl(Uri.parse(url)),
        icon: FaIcon(icon, size: 20, color: iconColor),
        label: Text(text, style: AppStyles.s16W700.copyWith(color: textColor)),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,

          padding: const EdgeInsets.symmetric(vertical: 20),
          textStyle: AppStyles.s16W700.copyWith(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
