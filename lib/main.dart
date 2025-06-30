import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/home_screen.dart';
import 'package:my_portfolio/theme/app_theme.dart';
import 'package:my_portfolio/theme/change_theme.dart'; // افترض أن ChangeTheme موجود هنا
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ChangeTheme(prefs: prefs),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ChangeTheme>();
    return MaterialApp(
      title: 'Karim Tamer Portfolio',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
