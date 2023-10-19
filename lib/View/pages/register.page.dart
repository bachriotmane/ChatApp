// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_chat_app/View/components/button.comp.dart';
import 'package:my_chat_app/View/components/textfieled.dart';
import 'package:my_chat_app/View/pages/login.page.dart';
import 'package:my_chat_app/utils/functions.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                //! Logo
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/logo.jpg",
                    ),
                    radius: 50,
                  ),
                ),
                //! Text
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child: const Text(
                    "Welcome to register page!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                Row(
                  children: [
                    Expanded(
                      child: MyTextFiled(
                        controller: firstNameController,
                        hintText: "First Name",
                        obscure: false,
                      ),
                    ),
                    Expanded(
                      child: MyTextFiled(
                        controller: lastNameController,
                        hintText: "Last Name",
                        obscure: false,
                      ),
                    )
                  ],
                ),
                MyTextFiled(
                    controller: emailController,
                    hintText: "Email",
                    obscure: false),
                MyTextFiled(
                    controller: password1Controller,
                    hintText: "Password",
                    obscure: true),
                MyTextFiled(
                    controller: password2Controller,
                    hintText: "Verify Password",
                    obscure: true),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                MyBotton(btnText: "Register", onTap: () {}),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already a membre?",
                      style: TextStyle(fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        pushReplacementTopage(LoginPage(), context);
                      },
                      child: const Text(
                        " Login now!",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
