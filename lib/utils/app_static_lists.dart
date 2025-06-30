import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/models/course.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/utils/app_assets.dart';
import 'package:my_portfolio/utils/app_strings.dart' show AppStrings;
import 'package:my_portfolio/widgets/contact_info_tile.dart';

class AppStaticLists {
  static final List<Project> projects = [
    Project(
      title: AppStrings.projectMothooqTitle,
      description: AppStrings.projectMothooqDescription,
      longDescription: AppStrings.projectMothooqLongDescription,
      imageUrls: [
        AppAssets.mothooqAuthShot,
        AppAssets.mothooqCarDetailsShot,
        AppAssets.mothooqServicesShot,
      ],
      tags: [
        AppStrings.tagFlutter,
        AppStrings.tagDart,
        AppStrings.tagMVVM,
        AppStrings.tagBloc,
        AppStrings.tagTheming,
        AppStrings.tagFirebaseAuth,
        AppStrings.tagFirebaseRealtimeDB,
        AppStrings.tagGoogleSignIn,
        AppStrings.tagFacebookSignIn,
      ],
      githubUrl:
          'https://drive.google.com/drive/folders/1IYZBUvbWJ6e18FKV7sm7NFvf_nKkDbiT?usp=drive_link',
      appUrl:
          'https://drive.google.com/drive/folders/1IYZBUvbWJ6e18FKV7sm7NFvf_nKkDbiT?usp=drive_link',
    ),
    Project(
      title: AppStrings.projectTaskifyTitle,
      description: AppStrings.projectTaskifyDescription,
      longDescription: AppStrings.projectTaskifyLongDescription,
      imageUrls: [
        AppAssets.taskifyOnboardingShot,
        AppAssets.taskifyAddTaskShot,
        AppAssets.taskifyBottomBarShot,
        AppAssets.taskifyEditTaskShot,
      ],
      tags: [
        AppStrings.tagFlutter,
        AppStrings.tagDart,
        AppStrings.tagMVVM,
        AppStrings.tagBloc,
        AppStrings.tagSqflite,
        AppStrings.tagLocalNotifications,
        AppStrings.tagTheming,
        AppStrings.tagFastlane,
        AppStrings.tagShorebird,
      ],
      githubUrl: 'https://github.com/KarimTamer74/Taskify-App',
      appUrl:
          'https://drive.google.com/drive/folders/12lWXLEjITDdCj1uG-GlKcPH2eQIpfRew?usp=drive_link',
    ),
    Project(
      title: AppStrings.projectChatbotTitle,
      description: AppStrings.projectChatbotDescription,
      longDescription: AppStrings.projectChatbotLongDescription,
      imageUrls: [
        AppAssets.chatbotOnboardingShot,
        AppAssets.chatbotAuthShot,
        AppAssets.chatbotProfileShot,
      ],
      tags: [
        AppStrings.tagFlutter,
        AppStrings.tagDart,
        AppStrings.tagMVVM,
        AppStrings.tagBloc,
        AppStrings.tagGeminiAI,
        AppStrings.tagFirebaseAuth,
        AppStrings.tagSharedPrefs,
        AppStrings.tagLocalization,
        AppStrings.tagTheming,
      ],
      githubUrl: 'https://github.com/KarimTamer74/chatbot-app/tree/master',
      appUrl:
          'https://drive.google.com/drive/folders/1G_FkGid0WmnjgJ-zcuug08taKD2zCzOk?usp=drive_link',
    ),
    Project(
      title: AppStrings.projectBooklyTitle,
      description: AppStrings.projectBooklyDescription,
      longDescription: AppStrings.projectBooklyLongDescription,
      imageUrls: null,
      tags: [
        AppStrings.tagFlutter,
        AppStrings.tagRestApi,
        AppStrings.tagAnimations,
      ],
      githubUrl: 'https://github.com/KarimTamer74/Bookly-App',
      appUrl:
          'https://drive.google.com/drive/folders/19oNubhf5omqqaYXl_2R_LxzxSTXIAmsN?usp=drive_link',
    ),
    Project(
      title: AppStrings.projectNewsTitle,
      description: AppStrings.projectNewsDescription,
      longDescription: AppStrings.projectNewsLongDescription,
      imageUrls: null,
      tags: [AppStrings.tagFlutter, AppStrings.tagDart, AppStrings.tagRestApi],
      githubUrl: 'https://github.com/KarimTamer74/news-app',
    ),
  ];

  static final List<Course> courses = [
    Course(
      title: AppStrings.courseResponsiveUi,
      platform: AppStrings.platformUdemy,
      duration: AppStrings.durationDec24ToJan25,
    ),
    Course(
      title: AppStrings.courseBlocMvvm,
      platform: AppStrings.platformUdemy,
      duration: AppStrings.durationJun24ToAug24,
    ),
    Course(
      title: AppStrings.courseCompleteFlutter,
      platform: AppStrings.platformUdemy,
      duration: AppStrings.durationJan24ToMay24,
    ),
  ];

  static final List<ContactInfoTile> contactTiles = [
    ContactInfoTile(
      icon: FontAwesomeIcons.envelope,
      title: AppStrings.contactEmailTitle,
      subtitle: AppStrings.contactEmailValue,
      url: AppStrings.contactEmailUrl,
    ),
    ContactInfoTile(
      icon: FontAwesomeIcons.phone,
      title: AppStrings.contactPhoneTitle,
      subtitle: AppStrings.contactPhoneValue,
      url: AppStrings.contactPhoneUrl,
    ),
    ContactInfoTile(
      icon: FontAwesomeIcons.github,
      title: AppStrings.contactGitHubTitle,
      subtitle: AppStrings.contactGitHubValue,
      url: AppStrings.contactGitHubUrl,
    ),
    ContactInfoTile(
      icon: FontAwesomeIcons.linkedinIn,
      title: AppStrings.contactLinkedInTitle,
      subtitle: AppStrings.contactLinkedInValue,
      url: AppStrings.contactLinkedInUrl,
    ),
  ];
}
