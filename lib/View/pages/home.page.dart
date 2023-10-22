import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/Controller/firebase_services/firebase_servicesImpl.dart';
import 'package:my_chat_app/View/pages/register.page.dart';
import 'package:my_chat_app/utils/functions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              print("Sign out");
              (FirebaseAuthServices()).signOut();
              pushReplacementTopage(RegisterPage(), context);
            },
            child: const Text("Sign out")),
      ),
    );
  }
}
