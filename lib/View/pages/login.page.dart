import 'package:flutter/material.dart';
import 'package:my_chat_app/View/components/button.comp.dart';
import 'package:my_chat_app/View/components/textfieled.dart';
import 'package:my_chat_app/View/pages/register.page.dart';
import 'package:my_chat_app/utils/functions.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    final RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (value != null && value.isEmpty) {
      return "Please enter your email";
    } else if (value != null && !emailRegExp.hasMatch(value)) {
      return "please enter a valis emil";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value != null && value.isEmpty) {
      return "Please enter your password";
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
                    margin: const EdgeInsets.only(top: 30),
                    child: const Text(
                      "Welcome to login page!",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  //! Email
                  MyTextFiled(
                      validator: validateEmail,
                      hintText: "Email",
                      obscure: false,
                      controller: emailController),
                  //! Password
                  MyTextFiled(
                      validator: validatePassword,
                      hintText: "Password",
                      obscure: true,
                      controller: passwordController),
                  //! Forgot Password
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.6),
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  //! Login Button
                  MyBotton(
                    btnText: "Login",
                    onTap: () {},
                  ),
                  //! Texttoregister
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Not a member?",
                        style: TextStyle(fontSize: 20),
                      ),
                      GestureDetector(
                        onTap: () {
                          pushReplacementTopage(RegisterPage(), context);
                        },
                        child: const Text(
                          " Register now!",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              decorationStyle: TextDecorationStyle.wavy,
                              color: Colors.blue),
                        ),
                      )
                    ],
                  )
                  //! Goto register Page
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
