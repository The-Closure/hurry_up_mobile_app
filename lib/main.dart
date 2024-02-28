import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riide/core/config/get_it.dart';
import 'package:riide/core/config/observer.dart';
import 'package:riide/feature/auth/sign_in/sign_in_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  Bloc.observer = MyBlocObserver();
  runApp(
    const BetterFeedback(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: config.get<SharedPreferences>().getString('token') == null ? SignInScreen() : HomeScreen() ;
      home: SingInScreen(),
    );
  }
}
