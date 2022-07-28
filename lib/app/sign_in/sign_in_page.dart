import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_app/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker_app/app/sign_in/sign_in_bloc.dart';
import 'package:time_tracker_app/common_widgets/custom_elevated_button.dart';
import 'package:time_tracker_app/common_widgets/show_exception_alert_dialog.dart';
import 'package:time_tracker_app/services/auth.dart';

class SignInPage extends StatelessWidget {
  final SignInBloc bloc;
  const SignInPage({Key? key, required this.bloc}) : super(key: key);

  static Widget create(BuildContext context) {
    final auth = Provider.of(context, listen: false);
    return Provider<SignInBloc>(
      create: (_) => SignInBloc(auth: auth),
      dispose: (_, bloc) => bloc.dispose(),
      child: Consumer<SignInBloc>(
        builder: (_, bloc, __) => SignInPage(bloc: bloc),
      ),
    );
  }

  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseException &&
        exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
    showExceptionAlertDialog(
      context,
      title: 'SignIn Failed',
      exception: exception,
    );
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      await bloc.signInAnonymously();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await bloc.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EmailSignInPage(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<bool>(
          stream: bloc.isLoadingStream,
          initialData: false,
          builder: (context, snapshot) {
            return _buildContent(context, snapshot.hasData);
          }),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildContent(BuildContext context, bool isLoading) {
    return Container(
      decoration: const BoxDecoration(
          //borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
            Color.fromARGB(255, 177, 29, 204),
            Color.fromARGB(255, 95, 10, 230)
          ])),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.0,
                child: _buildHeader(isLoading),
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
                onpressed: () => _signInWithGoogle(context),
              ),
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
                onpressed: () => _signInAnonymously(context),
              ),
            ]),
      ),
    );
  }

  Widget _buildHeader(bool isLoading) {
    // if (isLoading) {
    //   return const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }
    return const Text(
      'Sign In',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "poppins",
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}
