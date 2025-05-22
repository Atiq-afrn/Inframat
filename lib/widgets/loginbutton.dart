import 'package:flutter/material.dart';

class Loginbutton extends StatelessWidget {
  const Loginbutton({
    super.key,
    required this.backgroundcolor,
    required this.textname,
  });
  final String textname;
  final Color backgroundcolor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width * .32,
        decoration: BoxDecoration(
          color: backgroundcolor,

          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
          child: Text(
            textname,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
