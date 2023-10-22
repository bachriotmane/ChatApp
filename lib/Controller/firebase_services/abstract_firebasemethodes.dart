import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class FireBaseServices {
  Future<UserCredential?> registerWithEmailPassword(
      String email, String password, BuildContext context);
  Future<UserCredential?> loginWithEmailPassword(
      String email, String password, BuildContext context);

  Future<void> signOut();
}
