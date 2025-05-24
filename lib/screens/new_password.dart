import 'package:flutter/material.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/const/imageconst.dart';
import 'package:inframat/models/new_password_model.dart';
import 'package:inframat/provider/new_password_provider.dart';
import 'package:inframat/screens/login.dart';
import 'package:provider/provider.dart';

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
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Appcolor.whitecolor,
        title: Text("New Password"),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
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
                child: TextFormField(
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
                child: TextFormField(
                  onChanged: (value) {
                    if (value != _newPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Password did not match")),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Password matched")),
                      );
                    }
                  },

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
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.width * .2),
              GestureDetector(
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Appcolor.red,
                        content: Center(
                          child: Text(
                            "please enter the password field",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  }
                  Provider.of<NewPasswordProvider>(context, listen: false)
                      .gettingNewPassword(
                        _newPasswordController.text,
                        _confirmPasswordController.text,
                      )
                      .then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      });
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
        ),
      ),
    );
  }
}
