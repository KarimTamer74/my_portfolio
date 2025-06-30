import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeTheme extends ChangeNotifier {
  // --- MODIFIED: The field is now final and will be provided by the constructor ---
  final SharedPreferences prefs;
  bool isDark = false;

  // --- MODIFIED: The constructor now requires the SharedPreferences instance ---
  ChangeTheme({required this.prefs}) {
    // Load the theme as soon as the provider is created
    loadTheme();
  }

  bool get isDarkMode => isDark;

  // --- MODIFIED: Rewritten with async/await for better readability ---
  Future<void> changeTheme() async {
    isDark = !isDark;
    log("Theme changed to ${isDark ? 'Dark' : 'Light'}");
    
    try {
      await prefs.setBool('isDark', isDark);
      log("Theme preference saved: $isDark");
    } catch (error) {
      log("Error saving theme preference: $error");
    }
    
    notifyListeners();
  }

  // --- MODIFIED: This method is now simpler ---
  void loadTheme() {
    log("Loading theme preference");
    try {
      // The '?? false' handles the case where the key doesn't exist yet (first app run)
      isDark = prefs.getBool('isDark') ?? false;
      log("Loaded theme preference: $isDark");
    } catch (error) {
      log("Error loading theme preference: $error");
      isDark = false; // Default to light mode on error
    }
    // No need to call notifyListeners() here since it's called in the constructor
    // before the UI is built, but it doesn't hurt.
  }
}