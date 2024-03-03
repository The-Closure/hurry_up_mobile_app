import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riide/core/config/get_it.dart';
import 'package:riide/core/config/observer.dart';
import 'package:riide/feature/auth/sign_in/sign_in_screen.dart';
import 'package:riide/feature/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  Bloc.observer = MyBlocObserver();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: config.get<SharedPreferences>().getString('token') == null
          ? SignInScreen()
          : const HomeScreen(),
    );
  }
}
