import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:my_chat_app/View/pages/home.page.dart";
import "package:my_chat_app/View/pages/login.page.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBKZ_8PVfbb_VwHw4P8yTMcFOH6zoM_oZE",
        appId: "1:36434956024:android:60204da7a7e7c1877a750d",
        messagingSenderId: "messagingSenderId",
        projectId: "chat-app-27389"),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: (user != null && user.emailVerified)
            ? const HomePage()
            : LoginPage());
  }
}
