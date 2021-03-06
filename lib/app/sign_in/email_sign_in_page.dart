import 'package:flutter/material.dart';
import 'package:time_tracker_app/app/sign_in/email_sign_in_form.dart';
import 'package:time_tracker_app/services/auth.dart';

class EmailSignInPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign In",
          style: TextStyle(
            fontFamily: "poppins",
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: EmailSignInForm(),
            color: Colors.deepPurple[200],
          ),
        ),
      ),
      backgroundColor: Colors.deepPurple[100],
    );
  }
}
