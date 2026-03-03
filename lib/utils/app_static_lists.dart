// utils/app_static_lists.dart
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/models/course.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/utils/app_assets.dart';
import 'package:my_portfolio/utils/app_strings.dart' show AppStrings;
import 'package:my_portfolio/widgets/contact_info_tile.dart';

class AppStaticLists {
  static final List<Project> projects = [
    Project(
      title: AppStrings.projectJobTaskerTitle,
      description: AppStrings.projectJobTaskerDescription,
      longDescription: AppStrings.projectJobTaskerLongDescription,
      imageUrls: [
        AppAssets.jobTaskerOnboardingShot,
        AppAssets.jobTaskerDashBoardShot,
        AppAssets.jobTaskerAppShot,
        AppAssets.jobTaskerTasksShot,
        AppAssets.jobTaskerTaskShot,
        AppAssets.jobTaskerProfileShot,
        AppAssets.jobTaskerSettingsShot,
        AppAssets.jobTaskerfocusShot,
      ],
      tags: [
        AppStrings.tagFlutter,
        AppStrings.tagDart,
        AppStrings.tagMVVM,
        AppStrings.tagBloc,
        AppStrings.tagSqflite,
        AppStrings.tagLocalNotifications,
        AppStrings.tagPushNotifications,
        AppStrings.tagTheming,
        AppStrings.tagFastlane,
        AppStrings.tagShorebird,
      ],
      githubUrl: 'https://github.com/KarimTamer74/Taskify-App',
      appUrl:
          'https://play.google.com/store/apps/details?id=com.karim.jobtasker',
    ),
    Project(
      title: AppStrings.projectBidMartTitle,
      description: AppStrings.projectBidMartDescription,
      longDescription: AppStrings.projectBidMartLongDescription,
      imageUrls: [
        AppAssets.bidMartSplashShot,
        AppAssets.bidMartOnboardingShot,
        AppAssets.bidMartAuthShot,
        AppAssets.bidMartLoadingShot,
        AppAssets.bidMartHomeShot,
        AppAssets.bidMartProductShot,

        AppAssets.bidMartAddProductShot,
        AppAssets.bidMartNotificationsShot,
        AppAssets.bidMartPaymentShot,
        AppAssets.bidMartProfileShot,
        AppAssets.bidMartSettingsShot,
        AppAssets.bidMartUserProductShot,
      ],
      tags: [
        AppStrings.tagFlutter,
        AppStrings.tagDart,
        AppStrings.tagCleanArchitecture,
        AppStrings.tagBloc,
        AppStrings.tagRestApi,
        AppStrings.tagPaymentIntegration,
        AppStrings.tagLocalNotifications,
        AppStrings.tagPushNotifications,
        AppStrings.tagSharedPrefs,
        AppStrings.tagTheming,
        AppStrings.tagShorebird,
      ],
      githubUrl: 'https://github.com/KarimTamer74/Taskify-App',
      appUrl:
          'https://drive.google.com/drive/folders/1kbLdD2cy-TKpTsR25eVtWxRx6TMUop2M?usp=drive_link',
    ),
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
      title: AppStrings.projectPlayZoneTitle,
      description: AppStrings.projectPlayZoneDescription,
      longDescription: AppStrings.projectPlayZoneLongDescription,
      imageUrls: [AppAssets.playZoneApp],
      tags: [
        AppStrings.tagFlutter,
        AppStrings.tagDart,
        AppStrings.tagMVVM,
        AppStrings.tagBloc,
        AppStrings.tagMapsIntegration,
      ],
      githubUrl: 'https://github.com/KarimTamer74/play_zone.git',
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
    // Project(
    //   title: AppStrings.projectBooklyTitle,
    //   description: AppStrings.projectBooklyDescription,
    //   longDescription: AppStrings.projectBooklyLongDescription,
    //   imageUrls: null,
    //   tags: [
    //     AppStrings.tagFlutter,
    //     AppStrings.tagDart,
    //     AppStrings.tagCleanArchitecture,
    //     AppStrings.tagBloc,
    //     AppStrings.tagHive,
    //     AppStrings.tagRestApi,
    //     AppStrings.tagPagination,
    //     AppStrings.tagAnimations,
    //   ],
    //   githubUrl: 'https://github.com/KarimTamer74/Bookly-App',
    //   appUrl:
    //       'https://drive.google.com/drive/folders/19oNubhf5omqqaYXl_2R_LxzxSTXIAmsN?usp=drive_link',
    // ),
    Project(
      title: AppStrings.projectNewsTitle,
      description: AppStrings.projectNewsDescription,
      longDescription: AppStrings.projectNewsLongDescription,
      imageUrls: [AppAssets.newsHomeShot, AppAssets.newsSourcesShot],
      tags: [
        AppStrings.tagFlutter,
        AppStrings.tagDart,
        AppStrings.tagMVVM,
        AppStrings.tagRestApi,
        AppStrings.tagBloc,
      ],
      githubUrl: 'https://github.com/KarimTamer74/nti_newApp.git',
    ),
  ];

  static final List<Course> courses = [
    Course(
      title: AppStrings.coursePaymentFlutter,
      platform: AppStrings.platformUdemy,
      duration: AppStrings.durationOfPayment,
    ),
    Course(
      title: AppStrings.courseMapsFlutter,
      platform: AppStrings.platformUdemy,
      duration: AppStrings.durationOfMaps,
    ),
    Course(
      title: AppStrings.courseCleanArchitectureFlutter,
      platform: AppStrings.platformUdemy,
      duration: AppStrings.durationOfCleanArchitecture,
    ),
    Course(
      title: AppStrings.courseNtiFlutter,
      platform: AppStrings.platformUdemy,
      duration: AppStrings.durationOfNti,
    ),
    Course(
      title: AppStrings.courseResponsiveUi,
      platform: AppStrings.platformUdemy,
      duration: AppStrings.durationOfResponsive,
    ),
    Course(
      title: AppStrings.courseBlocMvvm,
      platform: AppStrings.platformUdemy,
      duration: AppStrings.durationOfBlocMvvm,
    ),
    Course(
      title: AppStrings.courseCompleteFlutter,
      platform: AppStrings.platformUdemy,
      duration: AppStrings.durationOfCompleteFlutter,
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
