import 'package:flutter/material.dart';
import 'package:internship/Weel_3/otppage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'otppage.dart';

class OtpSigninScreen extends StatefulWidget {
  const OtpSigninScreen({super.key});

  @override
  State<OtpSigninScreen> createState() => _OtpSigninScreenState();
}

class _OtpSigninScreenState extends State<OtpSigninScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  final formkey = GlobalKey<FormState>();
  String? _selectedCountryCode;
  String phoneNumber = '';
  @override
  void initState() {
    super.initState();
    emailFocusNode.addListener(_onFocusChange);
    phoneFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/otpsignin.png",
                    height: 220,
                    width: 180,
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  "OTP Verification",
                  style: TextStyle(fontSize: 20, fontFamily: 'Bold'),
                ),
                SizedBox(height: 12),
                Text(
                  "Enter email and phone number to \nsend one time Password",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Semibold',
                    color: Color(0xFFB6B6B6),
                  ),
                ),
                SizedBox(height: 40),
                TextFormField(
                  focusNode: emailFocusNode,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: emailFocusNode.hasFocus
                          ? Color(0xffF87C47)
                          : Color(0xffDDDDDD),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xFFFF8D4D),
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xFFB6B6B6),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xFFFF8D4D),
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Your Email";
                    } else if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(value)) {
                      return "Write Email Properly Ex abc@gmail.com";
                    }
                  },
                ),
                SizedBox(height: 40),
                IntlPhoneField(
                  focusNode: phoneFocusNode,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    phoneNumber = phone.completeNumber;
                    _selectedCountryCode = phone.countryCode;
                  },
                  decoration: InputDecoration(
                    counterText: '',
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                      color: phoneFocusNode.hasFocus
                          ? Color(0xffF87C47)
                          : Color(0xffDDDDDD),
                    ),
                    focusColor: Color(0xFFFF8D4D),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xFFFF8D4D),
                        width: 2.0,
                      ),
                    ),
                    // enabledBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(12),
                    //   borderSide: BorderSide(
                    //     color: Color(0xFFB6B6B6),
                    //     width: 1.0,
                    //   ),
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xFFFF8D4D),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      print(emailController.text);
                      print(phoneController.text);
                      phoneNumber = phoneController.text;
                      // emailController.clear();
                      // phoneController.clear();
                      setState(() {});
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OtpPage(PhoneNumber: phoneNumber),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF87C47),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(fontSize: 16, fontFamily: 'Bold'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
