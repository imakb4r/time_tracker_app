// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_app/common_widgets/custom_elevated_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  Future<void> _signInAnonymously() async {
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    print(userCredential.user!.uid);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time Tracker"),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 48.0),
            CustomElevatedButton(
              icon: const Icon(
                Icons.g_mobiledata_sharp,
                size: 35.0,
                color: Colors.red,
              ),
              borderRadius: 8.0,
              btnText: "Sign in With Gmail",
              onpressed: () {},
            ),
            const SizedBox(height: 8.0),
            CustomElevatedButton(
              icon: const Icon(
                Icons.facebook,
                size: 35.0,
                color: Colors.red,
              ),
              borderRadius: 8.0,
              btnText: "Sign in With FaceBook",
              onpressed: () {},
            ),
            const SizedBox(height: 8.0),
            CustomElevatedButton(
              icon: const Icon(
                Icons.email_rounded,
                size: 35.0,
                color: Colors.red,
              ),
              borderRadius: 8.0,
              btnText: "Sign in With Email",
              onpressed: () {},
            ),
            const SizedBox(height: 8.0),
            const Divider(
              color: Colors.indigoAccent,
              thickness: 2.0,
              indent: 25.0,
              endIndent: 25.0,
            ),
            const Text(
              "Or",
              style: TextStyle(
                fontSize: 14,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            CustomElevatedButton(
              icon: const Icon(
                Icons.perm_identity_rounded,
                size: 35.0,
                color: Colors.red,
              ),
              borderRadius: 8.0,
              btnText: "Go Anonymous",
              onpressed: _signInAnonymously,
            ),
          ]),
    );
  }
}
