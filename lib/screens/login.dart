import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/const/imageconst.dart';
import 'package:inframat/provider/forget_password_provider.dart';
import 'package:inframat/provider/login_provider.dart';
import 'package:inframat/provider/operator_login_provider.dart';
import 'package:inframat/screens/dashboard.dart';
import 'package:inframat/screens/forget_password.dart';

import 'package:inframat/shared_pref/shared_preferance.dart';
import 'package:inframat/widgets/loginbutton.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: _formKey,
        child: Consumer<LoginProvider>(
          builder: (context, value, child) {
            return Scaffold(
              backgroundColor: Appcolor.whitecolor,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height * .5,
                      width: double.infinity,
                      AppImages.loginimage,
                    ),

                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * .75,
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        validator:
                            (value) => value!.isEmpty ? "enter email" : null,
                        keyboardType: TextInputType.number,
                        controller: mobileNoController,
                        decoration: InputDecoration(
                          hintText: " Enter Mobile No",
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        obscureText: true,
                        obscuringCharacter: "*",
                        onChanged: (values) {
                          setState(() {});
                        },
                        validator:
                            (value) =>
                                value!.isEmpty ? "enter your password" : null,
                        controller: passwordController,
                        decoration: InputDecoration(hintText: " Password"),
                      ),
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        Provider.of<ForgetpasswordProvider>(
                          context,
                          listen: false,
                        ).getPassword(mobileNoController.text).then((value) {
                          if (value?.message ==
                                  "OTP sent to your registered number." &&
                              mobileNoController.text.toString().length == 10) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => ForgetPassword(
                                      mobileNo: mobileNoController.text,
                                      otp: value!.otp.toString(),
                                    ),
                              ),
                            );
                            ScaffoldMessenger.of(context)..showSnackBar(
                              SnackBar(
                                backgroundColor: Appcolor.gcol,
                                content: Text(
                                  "${value!.message.toString()}, OTP: ${value.otp}",
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  243,
                                  37,
                                  37,
                                ),
                                content: Center(
                                  child: Text("Invalid Mobile No"),
                                ),
                              ),
                            );
                          }
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .6,
                        ),
                        child: Text(
                          "Forget Password",
                          style: TextStyle(color: Color(0xff8D51D6)),
                        ),
                      ),
                    ),

                    SizedBox(height: 40),
                    mobileNoController.text.isNotEmpty
                        ? GestureDetector(
                          onTap: () {
                            _formKey.currentState!.validate();
                            Provider.of<OperatorLoginProvider>(
                                  context,
                                  listen: false,
                                )
                                .getOperatorLogin(
                                  mobileNoController.text,
                                  passwordController.text,
                                )
                                .then((value) {
                                  if (value?.authCode != null) {
                                    AppStorage.storeAuthId(value!.authCode);

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Dashboard(),
                                      ),
                                    );

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        duration: Duration(seconds: 2),
                                        backgroundColor: const Color.fromARGB(
                                          255,
                                          174,
                                          230,
                                          175,
                                        ),
                                        content: Center(
                                          child: Text("Login successful."),
                                        ),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Invalid Mobile No or Password",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                });
                          },
                          child: Loginbutton(
                            backgroundcolor: Appcolor.deepPurple,
                            textname: "Login",
                          ),
                        )
                        : Loginbutton(
                          backgroundcolor: Appcolor.greycolor,
                          textname: "Login",
                        ),
                    SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start, // Ensures better alignment for multiline
                        children: [
                          Icon(Icons.check_box, color: Color(0xff8D51D6)),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "I agree to receive important updates on WhatsApp",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width *
                                    0.032, // responsive font size
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start, // Ensures better alignment for multiline
                        children: [
                          SizedBox(width: 8),
                          Expanded(
                            child: Center(
                              child: Text(
                                " By signing up, you agree to inframat",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width *
                                      0.032, // responsive font size
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "     Terms of Service",
                          style: TextStyle(color: Color(0xff8D51D6)),
                        ),
                        Text(" & "),
                        Text(
                          "Privacy Policy",
                          style: TextStyle(color: Color(0xff8D51D6)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
