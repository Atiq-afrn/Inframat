import 'package:flutter/material.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/const/imageconst.dart';
import 'package:inframat/screens/login.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Appcolor.whitecolor,
        title: Text("New Password"),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * .1),
          Container(child: Image.asset(AppImages.forgetPassword)),

          SizedBox(height: 20),
          Text(
            "New Password",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _newPasswordController,
              obscureText: !_isNewPasswordVisible,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                hintText: "New Password",

                suffixIcon: IconButton(
                  icon: Icon(
                    _isNewPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isNewPasswordVisible = !_isNewPasswordVisible;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 10),

          // Confirm Password Field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _confirmPasswordController,
              obscureText: !_isConfirmPasswordVisible,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                hintText: "Confirm Password",

                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
              ),
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.width * .2),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width * .5,
              decoration: BoxDecoration(
                color: Appcolor.deepPurple,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  "Send",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Appcolor.whitecolor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
