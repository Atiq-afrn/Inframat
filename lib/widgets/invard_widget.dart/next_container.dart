import 'package:flutter/material.dart';
import 'package:inframat/const/color.dart';

class NextContainer extends StatelessWidget {

  const NextContainer({super.key,required this.textname});
  final String textname;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * .85,
      decoration: BoxDecoration(
        color: Appcolor.deepPurple,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          textname,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Appcolor.whitecolor,
          ),
        ),
      ),
    );
  }
}
