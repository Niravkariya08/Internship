import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter/semantics.dart';
import 'package:internship/DashBoard.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpPage extends StatefulWidget {
  final String PhoneNumber;
  const OtpPage({super.key, required this.PhoneNumber});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final formkey = GlobalKey<FormState>();
  Timer? timer;
  int secondsRemaining = 30;
  bool isResendEnabled = false;
  final int initialSeconds = 30;
  bool codeVerify = false;
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void despose() {
    timer!.cancel();
    super.dispose();
  }

  void _startTimer() {
    timer?.cancel();
    setState(() {
      secondsRemaining = initialSeconds;
      isResendEnabled = false;
    });

    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer timer) {
      if (secondsRemaining == 0) {
        setState(() {
          isResendEnabled = true;
          timer.cancel();
        });
      } else {
        setState(() {
          secondsRemaining--;
        });
      }
    });
  }

  void handleResend() {
    _startTimer();
  }

  String get timerText {
    if (isResendEnabled) {
      return "Resend OTP";
    } else {
      String seconds = (secondsRemaining % 60).toString().padLeft(2, '0');
      return "Resend in $seconds";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              "Verification Code",
              style: TextStyle(fontSize: 24, fontFamily: 'Bold'),
            ),
            SizedBox(height: 14),
            Text(
              "We have sent the verification code\nto your Mobile No : ${widget.PhoneNumber} ",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Semibold',
                color: Color(0xFFB6B6B6),
              ),
            ),
            SizedBox(height: 40),
            Form(
              key: formkey,
              child: Pinput(
                controller: otpController,
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                pinAnimationType: PinAnimationType.rotation,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter OTP';
                  } else if (value == '0810') {
                    return 'Successfully Verified';
                  } else {
                    return 'Pin is incorrect';
                  }
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                onChanged: (value) {
                  if (value == '0810') {
                    setState(() {
                      codeVerify = true;
                    });
                  }
                },
                errorPinTheme: PinTheme(
                  height: 56,
                  width: 56,
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(30, 60, 87, 1),
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                defaultPinTheme: PinTheme(
                  height: 56,
                  width: 56,
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(30, 60, 87, 1),
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFDDDDDD)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  height: 60,
                  width: 60,
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(30, 60, 87, 1),
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFF87C47)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Didn't receive the OTP?",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Semibold',
                    color: Color(0xFFB6B6B6),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    isResendEnabled ? handleResend() : null;
                  },
                  child: Text(timerText),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                } else {
                  if (codeVerify == true) {
                    otpController.clear();
                    setState(() {
                      codeVerify = false;
                    });
                    var sharedPref = await SharedPreferences.getInstance();
                    sharedPref.setBool('isLogin', true);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF87C47),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shadowColor: Color(0xFFF87C47),
                elevation: 4,
              ),
              child: Text(
                "Continue",
                style: TextStyle(fontSize: 16, fontFamily: 'Bold'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
