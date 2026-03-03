// utils/app_strings.dart
class AppStrings {
  static const String appTitle = 'Karim Tamer Portfolio';

  // Section Titles
  static const String sectionAboutMe = 'About Me';
  static const String sectionSkills = 'My Skills';
  static const String sectionProjects = 'Projects';
  static const String sectionExperience = 'Experience';
  static const String sectionEducation = 'Education';
  static const String sectionContact = 'Contact Me';

  // About Me
  static const String aboutMeSummary =
      'Junior Flutter Developer specializing in scalable, high-performance mobile applications using Flutter and Dart. Experienced in Clean Architecture, BLoC, Firebase, and RESTful API integration with a strong focus on clean, maintainable code. Currently a Flutter Instructor at NTI, delivering hands-on, industry-aligned development training.';

  static const String viewOnGitHub = 'View on GitHub';
  static const String viewOnDrive = 'View on Drive';
  // Skills
  static const String skillFlutter = 'Flutter';
  static const String skillDart = 'Dart';
  static const String skillBloc = 'BLoC';
  static const String skillMVVM = 'MVVM';
  static const String skillRestApi = 'REST API';
  static const String skillFirebase = 'Firebase';
  static const String skillFirestore = 'Firestore';
  static const String skillSqflite = 'Sqflite';
  static const String skillShorebird = 'Shorebird';
  static const String skillFastlane = 'Fastlane';
  static const String skillResponsiveUi = 'Responsive UI';
  static const String skillLocalization = 'Localization';
  static const String skillGitAndGitHub = 'Git & GitHub';
  static const String skillSQL = 'SQL';
  static const String skillOop = 'OOP';
  static const String skillSolid = 'SOLID Principles';

  // Projects Info
  static const String projectBidMartTitle = 'BidMart-App';
  static const String projectBidMartDescription =
      'BidMart is a Flutter-based real-time auction app enabling live bidding, secure payments, and instant notifications, built with Clean Architecture for scalability and maintainability.';
  static const String projectBidMartLongDescription = '''
🛍️ Developed a real-time auction app where users browse products, enroll, and place live bids.

💳 Implemented secure payment flow with detailed product view and top bidders section.

🏪 Enabled sellers to register, upload products, and manage auctions seamlessly.

📡 Integrated real-time notifications for bidding activity, auction updates, and payment confirmations.''';

  static const String projectJobTaskerTitle = 'JobTasker-App';
  static const String projectJobTaskerDescription =
      "Productivity-focused job application tracking app built with Clean Architecture and BLoC, helping users systematically manage applications, tasks, and focus sessions.";
  static const String projectJobTaskerLongDescription = '''
📊 Designed and developed a job application tracking system with integrated task management and Focus Mode to streamline productivity and job search workflows.

🎯 Built intuitive UX for tracking job status, CV versions, job type, and work mode, managing the full lifecycle through Google Play deployment.

⏰ Supports task creation with reminders and repeat intervals (daily, weekly, etc.).

🔔 Integrated local notifications for upcoming task alerts.

🧠 Includes a built-in Focus Mode to reduce distractions and enhance productivity.

🏗️ Implemented structured state management using BLoC with scalable architecture design.

🎨 Features a minimalistic UI with smooth navigation and responsive design.''';
  
  
  static const String projectMothooqTitle = 'Mothooq-App';
  static const String projectMothooqDescription =
      'A used car marketplace with Firebase Authentication, Realtime Database, BLoC, and role-based access.';
  static const String projectMothooqLongDescription = '''
🚘 Built a used car marketplace enabling listings after mandatory inspections at partner service centers.

🔐 Implemented role-based access for users and service centers.

🔑 Integrated Google Sign-In with responsive UI and BLoC state management.

🔄 Used Firebase Realtime Database for real-time data synchronization.''';

//   static const String projectTaskifyTitle = 'Taskify-App';
//   static const String projectTaskifyDescription =
//       'A productivity ToDo app with Sqflite for local storage, MVVM architecture, and local notifications.';
//   static const String projectTaskifyLongDescription = '''
// • Smart and clean ToDo app focused on productivity and offline functionality.
// • Stores all data locally using Sqflite – no internet required.
// • Supports task creation with reminders and repeat intervals (daily, weekly, etc.).
// • Integrated local notifications to alert users about upcoming tasks.
// • Includes a built-in Focus Mode to reduce distractions and help users stay on track.
// • Built with MVVM architecture for maintainability and scalable code structure.
// • Features a minimalistic UI with smooth navigation and responsive design.''';

  static const String projectPlayZoneTitle = 'PlayZone-App';
  static const String projectPlayZoneDescription =
      'Play Zone is a location-based stadium explorer designed to help users easily discover football fields in their area and navigate to them using an interactive map.The app focuses on simplicity, performance, and real-time location interaction.';
  static const String projectPlayZoneLongDescription = '''
⭐ Stadium Discovery – Browse curated football fields with name, rating, and address in a clean card-based UI.

🔎 Smart Search – Instantly search and filter stadiums by name for fast access.

🗺️ Interactive Map View – View stadium locations on Google Maps with markers for both the stadium and your current position.

🧭 Route Drawing & Navigation – Generate routes between your location and the selected stadium with automatic camera animation and real-time tracking.

📡 Live Location Tracking – Detect location service status, request permissions dynamically, and update user position while moving.

🎯 Modern & Minimal UI – Clean, map-inspired design with smooth transitions and distraction-free experience.
''';

  static const String projectChatbotTitle = 'Chatbot-App';
  static const String projectChatbotDescription =
      'A real-time chatbot with Gemini AI integration, multilingual support (Arabic/English), and dark/light mode.';
  static const String projectChatbotLongDescription = '''
• Onboarding experience to introduce the app’s features for first-time users.
• Multilingual support (Arabic & English) with dynamic language switching.
• Firebase Authentication for secure and fast user login.
• Gemini AI integration for real-time, intelligent chatbot conversations.
• Chat interface with a clean, modern design and natural AI responses.
• Dark/Light mode toggle, saved via Shared Preferences.
• Persistent user settings including language, theme, and login state.
• Built using BLoC for state management and MVVM architecture for scalability and maintainability.''';

  static const String projectBooklyTitle = 'Bookly-App';
  static const String projectBooklyDescription =
      'A book discovery app with RESTful APIs and custom animations.';
  static const String projectBooklyLongDescription = '''
A task-oriented ToDo application with local data storage using Sqflite.
Features include onboarding screens, focus mode to minimize distractions, and local notification reminders.''';

  static const String projectNewsTitle = 'News-App';
  static const String projectNewsDescription =
      'News App is a modern Flutter application that delivers real-time headlines and categorized news using NewsAPI. Built with MVVM and BLoC (Cubit), it provides fast search, source filtering, and a clean, responsive user experience.';
  static const String projectNewsLongDescription = '''
🔥 Trending News: Real-time top headlines.

🔎 Smart Search: Fast article search by keywords.

🗂️ Category Browsing: Explore news by category.

📰 Article Details: Clean and readable article view.

🌍 News Sources: Browse and filter news providers.

📡 Live API Integration: Real-time data using NewsAPI with BLoC + MVVM architecture.''';

  // Project Tags
  static const String tagFlutter = 'Flutter';
  static const String tagDart = 'Dart';
  static const String tagMVVM = 'MVVM';
  static const String tagBloc = 'BLoC';
  static const String tagTheming = 'Theming';
  static const String tagFirebaseAuth = 'Firebase Auth';
  static const String tagFirebaseRealtimeDB = 'Firebase Realtime Database';
  static const String tagGoogleSignIn = 'Google Sign-In';
  static const String tagFacebookSignIn = 'Facebook Sign-In';
  static const String tagSqflite = 'Sqflite';
  static const String tagLocalNotifications = 'Local Notifications';
  static const String tagPushNotifications = 'Push Notifications';
  static const String tagFastlane = 'Fastlane';
  static const String tagShorebird = 'Shorebird';
  static const String tagGeminiAI = 'Gemini AI';
  static const String tagSharedPrefs = 'Shared Preferences';
  static const String tagLocalization = 'Localization';
  static const String tagRestApi = 'REST API';
  static const String tagAnimations = 'Animations';
  static const String tagHive = 'Hive';
  static const String tagPagination = 'Pagination';
  static const String tagCleanArchitecture = 'Clean Architecture';
  static const String tagPaymentIntegration = 'Payment Integration';
  static const String tagMapsIntegration = 'Maps Integration';

  // Courses Titles
  static const String coursePaymentFlutter =
      'Flutter Payment Integration: Stripe, PayPal & More';
  static const String courseMapsFlutter =
      'Flutter App Creation: Google Maps Integration Guide';
  static const String courseCleanArchitectureFlutter =
      'Deep Dive into Clean Architecture in Flutter';
  static const String courseResponsiveUi =
      'Mastering Flutter: Responsive & Adaptive UI Design';
  static const String courseBlocMvvm =
      'Flutter Advanced Course: BLoC and MVVM Pattern';
  static const String courseCompleteFlutter =
      'Complete Flutter & Dart Development Course';
  static const String courseNtiFlutter =
      'National Telecommunication Institute (NTI)';

  // Platforms
  static const String platformUdemy = 'Udemy';

  // Durations
  static const String durationOfPayment = '02/2026 - 03/2026';

  static const String durationOfMaps = '01/2026 - 02/2026';
  static const String durationOfCleanArchitecture = '11/2025';
  static const String durationOfNti = '02/2025 - 03/2025';

  static const String durationOfResponsive = '12/2024 - 01/2025';
  static const String durationOfBlocMvvm = '06/2024 - 08/2024';
  static const String durationOfCompleteFlutter = '01/2024 - 05/2024';

  // Education
  static const String educationDegree =
      'Bachelor of Engineering in Computer Engineering';
  static const String educationUniversity =
      'Tanta University, Tanta, Egypt\n09/2020 - 07/2025\nCumulative Grade: 85% (Excellent)';
  static const String courses = 'Courses';
  static const String certificationsAndTraining = 'Certifications & Training';
  // Contact / Links
  static const String linkedIn = 'LinkedIn';
  static const String contactGitHub = 'GitHub';
  static const String contactEmail = 'Email';
  static const String downloadResume = 'Download Resume';
  static const String getInTouch = 'Get in Touch';
  static const String sendMessage = 'Send a Message';
  static const String yourName = 'Your Name';
  static const String yourNameHint = 'Enter your name';
  static const String yourEmailHint = 'Enter your email address';
  static const String yourEmailError = 'Please enter a valid email address';
  static const String yourMessageError = 'Please enter a message';
  static const String yourMessageHint = 'Write your message here...';
  static const String yourEmail = 'Your Email';
  static const String message = 'Message';

  // Contact Info
  static const String contactEmailTitle = 'Email';
  static const String contactEmailValue = 'karimabokamel74@gmail.com';
  static const String contactEmailUrl = 'mailto:karimabokamel74@gmail.com';

  static const String contactPhoneTitle = 'Phone';
  static const String contactPhoneValue = '+20 114 877 9202';
  static const String contactPhoneUrl = 'tel:+201148779202';

  static const String contactGitHubTitle = 'GitHub';
  static const String contactGitHubValue = 'github.com/KarimTamer74';
  static const String contactGitHubUrl = 'https://github.com/KarimTamer74';

  static const String contactLinkedInTitle = 'LinkedIn';
  static const String contactLinkedInValue = 'linkedin.com/in/karim-tamer74';
  static const String contactLinkedInUrl =
      'https://www.linkedin.com/in/karim-tamer74/';
}
