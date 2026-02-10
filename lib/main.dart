import 'package:ed_tech_app/auth/sign_up_page.dart';
import 'package:ed_tech_app/screen/dashboard_screen.dart';
import 'package:ed_tech_app/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// Screens

import 'home/home_page.dart';

// (Login page can be added later)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Learning',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F9FB),
      ),

      // 🔥 Initial Screen
      home: const SplashScreen(),

      // 🔗 App Routes (Clean & Scalable)
      routes: {
        '/home': (context) => const HomePage(),
        '/signup': (context) => const SignUpPage(),
        '/dashboard': (context) => const DashboardPage(),

        // '/login': (context) => const LoginPage(), // next step
      },
    );
  }
}
