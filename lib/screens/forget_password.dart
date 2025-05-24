import 'package:flutter/material.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/const/imageconst.dart';
import 'package:inframat/models/otp_verification_model.dart';
import 'package:inframat/provider/opt_verify_provider.dart';
import 'package:inframat/screens/new_password.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key, this.mobileNo, this.otp});
  final String? mobileNo;
  final String? otp;
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // pincode = widget.otp;
    pinController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Appcolor.whitecolor,
        title: Text("Forget Password"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.width * .1),
            Container(child: Image.asset(AppImages.forgetPassword)),

            Text(
              "Enter Verification Code",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            pinCodeTextField(),
            SizedBox(height: MediaQuery.of(context).size.height * .2),
            pincode != null
                ? GestureDetector(
                  onTap: () {
                    Provider.of<OptVerifyProvider>(
                      context,
                      listen: false,
                    ).getVerifyOtp(widget.mobileNo!, widget.otp).then((value) {
                      if (pincode == widget.otp!) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewPassword(),
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("OTP Verified successfully")),
                        );
                      } else {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text("Invalid OTP")));
                      }
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
                        "Verify",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Appcolor.whitecolor,
                        ),
                      ),
                    ),
                  ),
                )
                : Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * .5,
                  decoration: BoxDecoration(
                    color: Appcolor.greycolor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      "Verify",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Appcolor.whitecolor,
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(190, 192, 195, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  String? pincode;
  late TextEditingController pinController;
  Widget pinCodeTextField() {
    return Pinput(
      controller: pinController,
      defaultPinTheme: defaultPinTheme,
      length: 4, // Make sure to match your OTP length
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) {
        setState(() {
          pincode = pin;
        });
        print("Completed PIN: $pin");
      },
    );
  }
}
