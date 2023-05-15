import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../util/showSnackBar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  Future<void> signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //email verification
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email Verification Sent');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> emailLogIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        showSnackBar(context, 'Check your email to verify your account');
      }else{
        context.go('/note-list');
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
