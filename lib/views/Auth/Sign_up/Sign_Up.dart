import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_project/core/domain/model/response_model/regester_model.dart';
import 'package:hurry_project/core/resources/colors.dart';
import 'package:hurry_project/views/Auth/Sign_up/bloc/sign_up_bloc.dart';
import 'package:hurry_project/views/widgets/container.dart';
import 'package:hurry_project/views/widgets/text_field.dart';
import 'package:super_rich_text/super_rich_text.dart';

// ignore: must_be_immutable
class SingupScreen extends StatelessWidget {
  SingupScreen({super.key});

  TextEditingController NameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
        create: (context) => SignUpBloc(),
        child: SingleChildScrollView(
          child: Scaffold(
            appBar: AppBar(backgroundColor: Colors.transparent,),
            backgroundColor: Colors.transparent,
            body: BlocConsumer<SignUpBloc, SignUpState>(
              listener: (context, state) {
                if (state is LoadingToSignUp) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('try to SignUp'),
                    backgroundColor: Colors.blue,
                    behavior: SnackBarBehavior.floating,
                  ));
                }
                if (state is SuccessSignUp) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: Duration(seconds: 7),
                    content: Text('Success in SignUp'),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                  ));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Scaffold()));
                }
                if (state is ErrorInSignUp || state is ExcptionInSignUp) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('There is a problem'),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                }
              },
              builder: (context, state) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        controller: NameController,
                        labelText: 'Enter your name',
                        
                      ),
                      MainTextField(
                        context: context,
                        controller: userNameController,
                        labelText: 'Enter email or username',
                      ),
                      MainTextField(
                        context: context,
                        controller: passwordController,
                        labelText: 'Enter your password',
                      ),
                      MainTextField(
                        context: context,
                        controller: genderController,
                        labelText: 'Enter your gender',
                      ),
                      MainTextField(
                        context: context,
                        controller: birthController,
                        labelText: 'Enter your Birth date',
                      ),
                      MainTextField(
                        context: context,
                        controller: phoneController,
                        labelText: 'Enter Your phone number',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 14,
                      ),
                      MainContainer(
                        context: context,
                        containerText: 'Sing Up',
                        onTap: () {
                          if (userNameController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            context.read<SignUpBloc>().add(SignUp(
                                NewUser: RegisterModel(
                                    name: NameController.text,
                                    email: userNameController.text,
                                    password: passwordController.text,
                                    gender: genderController.text,
                                    birth: birthController.text,
                                    phone: phoneController.text)));
                          }
                          if (userNameController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              duration: Duration(seconds: 3),
                              content: Text('you need to Enter your data'),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ));
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
