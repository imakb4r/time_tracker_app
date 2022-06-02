import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String btnText;
  final Icon icon;
  final VoidCallback onpressed;
  final double borderRadius;

  const CustomElevatedButton(
      {Key? key,
      required this.btnText,
      required this.icon,
      required this.onpressed,
      required this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(20, 50),
          primary: Colors.white,
          onPrimary: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          )),
      onPressed: onpressed,
      child: Row(
        children: [
          icon,
          const SizedBox(width: 60),
          Text(
            btnText,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
