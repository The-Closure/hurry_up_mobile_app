import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riide/core/domain/model/response_model/register.dart';
import 'package:riide/core/resources/color.dart';
import 'package:riide/feature/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:riide/feature/shares/container.dart';
import 'package:riide/feature/shares/text_field.dart';
import 'package:super_rich_text/super_rich_text.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? gender = 'Male';
  String? birthDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
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
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: BlocListener<SignUpBloc, SignUpState>(
              listener: (context, state) {},
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
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
                    "Create your RIIDE Acconte",
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
                    controller: emailController,
                    labelText: 'Enter your Email',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  MainTextField(
                    context: context,
                    controller: nameController,
                    labelText: 'Enter your Name',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  MainTextField(
                    context: context,
                    controller: passwordController,
                    labelText: 'Enter your Password',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  MainTextField(
                    context: context,
                    controller: phoneController,
                    labelText: 'Enter your Phone Number',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        height: MediaQuery.of(context).size.height / 8,
                        decoration: ShapeDecoration(
                          color: MainColor().bottonColor.withAlpha(255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 10,
                          child: CupertinoDatePicker(
                            backgroundColor: MainColor().bottonColor,
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: DateTime(1999, 11, 7),
                            onDateTimeChanged: (DateTime newDateTime) {
                              birthDay = "${newDateTime.year}"
                                  '-'
                                  "${newDateTime.month}"
                                  '-'
                                  "${newDateTime.day}";
                              print(birthDay);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 8,
                      ),
                      StatefulBuilder(
                        builder: (BuildContext context,
                            void Function(void Function()) setState) {
                          return DropdownButton<String>(
                              dropdownColor: Colors.black,
                              value: gender,
                              items: [
                                DropdownMenuItem<String>(
                                  value: 'Male',
                                  child: Text(
                                    'Male',
                                    style: TextStyle(
                                        color: MainColor().bottonColor),
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Female',
                                  child: Text(
                                    'Female',
                                    style: TextStyle(
                                        color: MainColor().bottonColor),
                                  ),
                                ),
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  gender = newValue;
                                });
                              });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 14,
                  ),
                  MainContainer(
                    context: context,
                    containerText: 'Sing Up',
                    onTap: () {
                      if (nameController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty &&
                          emailController.text.isNotEmpty &&
                          phoneController.text.isNotEmpty) {
                        context.read<SignUpBloc>().add(
                              CreateAnAccount(
                                user: RegisterModel(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    gender: gender!,
                                    birth: birthDay!,
                                    phone: phoneController.text),
                              ),
                            );
                      }
                      if (nameController.text.isEmpty ||
                          passwordController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          phoneController.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          duration: Duration(seconds: 10),
                          content: Text('Please Enter your Data'),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}