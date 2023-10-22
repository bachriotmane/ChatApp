// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/Controller/firebase_services/abstract_firebasemethodes.dart';
import 'package:my_chat_app/View/pages/home.page.dart';
import 'package:my_chat_app/utils/functions.dart';

class FirebaseAuthServices extends FireBaseServices {
  @override
  Future<UserCredential?> loginWithEmailPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential? credential;
      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if(credential.user!.emailVerified){
        pushReplacementTopage(const HomePage(), context);
      }else {
        showMyDialog(context, TypeError.ERROR, "Email not Verified",
            "Please verify your email and try again");
      }
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        showMyDialog(context, TypeError.ERROR, "User not found",
            "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        showMyDialog(context, TypeError.ERROR, "Wrong password",
            "Wrong password provided for that user.");
      }
    }
    return null;
  }

  @override
  Future<UserCredential?> registerWithEmailPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential? credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = credential.user;
      if (user != null && !user.emailVerified) {
        user.sendEmailVerification();
        showMyDialog(context, TypeError.INFO, "Check your Email",
            "We send you an emial to ${user.email}");
      }
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showMyDialog(context, TypeError.WARNING, "Weak password",
            "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        showMyDialog(context, TypeError.ERROR, "Email Already in use",
            "The This already exists , Try to add a new Email");
      }
      return null; // Return null in case of an error
    } catch (e) {
      showMyDialog(context, TypeError.INFO, "An error occured", e.toString());
      return null; // Return null in case of an error
    }
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
