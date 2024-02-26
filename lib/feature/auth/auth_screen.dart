import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riide/core/domain/model/response_model/login.dart';
import 'package:riide/core/resources/color.dart';
import 'package:riide/feature/auth/bloc/auth_bloc.dart';
// import 'package:riide/feature/auth/sign_in/bloc/sign_in_bloc.dart';
// import 'package:riide/feature/auth/sign_up/sign_up_screen.dart';
import 'package:riide/feature/shares/container.dart';
import 'package:riide/feature/shares/text_field.dart';
import 'package:super_rich_text/super_rich_text.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          tileMode: TileMode.repeated,
          colors: [
            Color.fromARGB(255, 7, 25, 19),
            Colors.black,
          ],
        ),
      ),
      child: BlocProvider(
        create: (context) => AuthBloc(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is LoadingAuthState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(seconds: 3),
                  content: Text('try to Login'),
                  backgroundColor: Colors.blue,
                  behavior: SnackBarBehavior.floating,
                ));
              }
              if (state is SuccessToSgininAuthState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(seconds: 7),
                  content: Text('Success in login'),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                ));
              }
              if (state is ErrorInSigninAuthState ) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(seconds: 5),
                  content: Text('fild in login'),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                ));
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                  ),
                  SuperRichText(
                    text: 'r lli ill d e',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                    ),
                    othersMarkers: [
                      MarkerText(
                        marker: 'll',
                        style: TextStyle(
                          color: MainColor().bottonColor,
                          fontSize: 60,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Welcome to RIIDE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  MainTextField(
                    context: context,
                    controller: userNameController,
                    labelText: 'Enter email or username',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  MainTextField(
                    context: context,
                    controller: passwordController,
                    labelText: 'Enter your password',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 14,
                  ),
                  MainContainer(
                    context: context,
                    containerText: 'Sing in',
                    onTap: () {
                      if (userNameController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        context.read<AuthBloc>().add(SignInEvent(
                            user: LoginModel(
                                email: userNameController.text,
                                password: passwordController.text)));
                      }
                      if (userNameController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          duration: Duration(seconds: 10),
                          content: Text('you need to Enter your name and id'),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ));
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t have an account ? ',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => SignUpScreen(),
                          //   ),
                          // );
                        },
                        child: const Text(
                          ' Sign up',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
