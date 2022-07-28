import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_app/common_widgets/show_alert_dialog.dart';
import '../services/auth.dart';

class HomePage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(context,
        title: 'Log Out ',
        content: 'Did you really want to Log Out?',
        cancleActionText: 'Cancle',
        defaultActionText: 'Logout');
    if (didRequestSignOut == true) {
      print("Logout Button Pressed");
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => _confirmSignOut(context),
            child: const Text(
              "Log Out",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
