// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:my_chat_app/Controller/firebase_services/abstract_firebasemethodes.dart';
import 'package:my_chat_app/Controller/firebase_services/firebase_servicesImpl.dart';
import 'package:my_chat_app/View/components/button.comp.dart';
import 'package:my_chat_app/View/components/textfieled.dart';
import 'package:my_chat_app/View/pages/login.page.dart';
import 'package:my_chat_app/utils/functions.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController password1Controller = TextEditingController();

  TextEditingController password2Controller = TextEditingController();

  FireBaseServices? firebaseServices;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    firebaseServices = FirebaseAuthServices();
  }

  String? validateEmpty(String? value) {
    if (value != null && value.isEmpty) {
      return "This filed is required";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value != null && value.isEmpty) {
      return "This filed is required";
    } else if (value != null && value.length < 5) {
      return "The password isweak";
    }
    return null;
  }

  String? validateVerificationPassword(String? value) {
    if (value != null && value.isEmpty) {
      return "This filed is required";
    } else if (value != null && value.length < 5) {
      return "The password isweak";
    } else if (password1Controller.text != password2Controller.text) {
      return "Please enter the correct password";
    }
    return null;
  }

  String? validateEmail(String? value) {
    final RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (value != null && value.isEmpty) {
      return "Please enter your email";
    } else if (value != null && !emailRegExp.hasMatch(value)) {
      return "please enter a valis emil";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
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
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                  Row(
                    children: [
                      Expanded(
                        child: MyTextFiled(
                          validator: validateEmpty,
                          controller: firstNameController,
                          hintText: "First Name",
                          obscure: false,
                        ),
                      ),
                      Expanded(
                        child: MyTextFiled(
                          validator: validateEmpty,
                          controller: lastNameController,
                          hintText: "Last Name",
                          obscure: false,
                        ),
                      )
                    ],
                  ),
                  MyTextFiled(
                      validator: validateEmail,
                      controller: emailController,
                      hintText: "Email",
                      obscure: false),
                  MyTextFiled(
                      validator: validatePassword,
                      controller: password1Controller,
                      hintText: "Password",
                      obscure: true),
                  MyTextFiled(
                      validator: validateVerificationPassword,
                      controller: password2Controller,
                      hintText: "Verify Password",
                      obscure: true),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  MyBotton(
                      btnText: "Register",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          firebaseServices!.registerWithEmailPassword(
                              emailController.text,
                              password1Controller.text,
                              context);
                        }
                      }),
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
      ),
    );
  }
}
