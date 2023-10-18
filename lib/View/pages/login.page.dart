import 'package:flutter/material.dart';
import 'package:my_chat_app/View/components/button.comp.dart';
import 'package:my_chat_app/View/components/textfieled.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
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
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              //! Email
              MyTextFiled(hintText: "Email", obscure: false),
              //! Password
              MyTextFiled(hintText: "Password", obscure: true),
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
                    onTap: () {},
                    child: const Text(
                      " Register now!",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
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
    );
  }
}
