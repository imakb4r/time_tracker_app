import 'package:flutter/material.dart';
import 'package:time_tracker_app/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker_app/common_widgets/custom_elevated_button.dart';
import 'package:time_tracker_app/services/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key, required this.auth}) : super(key: key);

  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  // Future<void> _signInWithFaceBook() async {
  //   try {
  //     await auth.signInWithFacebook();
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EmailSignInPage(
          auth: auth,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Time Tracker",
          style: TextStyle(
            fontFamily: "poppins",
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
        elevation: 1.5,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          //borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.purple, Colors.orange])),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 48.0),
              CustomElevatedButton(
                icon: const Icon(
                  Icons.g_mobiledata_sharp,
                  size: 35.0,
                  color: Colors.indigo,
                ),
                borderRadius: 8.0,
                btnText: "Sign in With Gmail",
                onpressed: () {
                  _signInWithGoogle();
                },
              ),
              // const SizedBox(height: 8.0),
              // CustomElevatedButton(
              //   icon: const Icon(
              //     Icons.facebook,
              //     size: 35.0,
              //     color: Colors.red,
              //   ),
              //   borderRadius: 8.0,
              //   btnText: "Sign in With FaceBook",
              //   onpressed: _signInWithFaceBook,
              // ),
              const SizedBox(height: 8.0),
              CustomElevatedButton(
                icon: const Icon(
                  Icons.email_rounded,
                  size: 35.0,
                  color: Colors.indigo,
                ),
                borderRadius: 8.0,
                btnText: "Sign in With Email",
                onpressed: () => _signInWithEmail(context),
              ),
              const SizedBox(height: 8.0),
              const Divider(
                color: Colors.indigo,
                thickness: 2.0,
                indent: 25.0,
                endIndent: 25.0,
              ),
              const Text(
                "Or",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              CustomElevatedButton(
                icon: const Icon(
                  Icons.perm_identity_rounded,
                  size: 35.0,
                  color: Colors.indigo,
                ),
                borderRadius: 8.0,
                btnText: "Go Anonymous",
                onpressed: _signInAnonymously,
              ),
            ]),
      ),
    );
  }
}
