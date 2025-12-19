import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:internship/Week_1/signinFormcontroller.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  final signinformcontroller signincontroller = Get.put(signinformcontroller());
  @override
  void dispose() {
    super.dispose();
    Get.delete<signinformcontroller>();
  }

  final formkey = GlobalKey<FormState>();

  bool emailDone = false;
  bool passwordVisible = false;

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   children: [
                //     IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                //   ],
                // ),
                // SizedBox(height: 30),
                Center(
                  child: Text(
                    "Let's Sign you in ",
                    style: TextStyle(
                      fontSize: 28,
                      // fontWeight: FontWeight.w800,
                      fontFamily: 'Bold',
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Lorem ipsum dolor sit amet,consectetur",
                    style: TextStyle(
                      color: Color.fromARGB(255, 199, 203, 206),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Medium',
                    ),
                  ),
                ),
                SizedBox(height: 26),
                Text(
                  "Email Address",
                  style: TextStyle(
                    color: Color.fromARGB(255, 177, 181, 186),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'SemiBold',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: signincontroller.emailController.value,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Your Email";
                    } else if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(value)) {
                      return "Write Email Properly Ex abc@gmail.com";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hint: Text(
                      "Enter Your email address",
                      style: TextStyle(
                        color: Color.fromARGB(255, 167, 174, 179),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'SemiBold',
                      ),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 245, 245, 245),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      borderSide: BorderSide.none,
                    ),
                    // suffixIcon: IconButton(
                    //   onPressed: () {
                    //     setState(() {
                    //       emailDone = !emailDone;
                    //     });
                    //   },
                    //   icon: Icon(emailDone ? Icons.cancel : Icons.done),
                    // ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Password",
                  style: TextStyle(
                    color: Color.fromARGB(255, 177, 181, 186),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SemiBold',
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  obscureText: !passwordVisible,
                  controller: signincontroller.passwordController.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hint: Text(
                      "Enter your password",
                      style: TextStyle(
                        color: Color.fromARGB(255, 167, 174, 179),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'SemiBold',
                      ),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 245, 245, 245),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: isChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                        ),
                        Text(
                          "Remember Me",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Regular',
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color.fromARGB(255, 251, 162, 156),
                          fontFamily: 'SemiBold',
                        ),
                      ),
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: "This Functionality Unavailable",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black54,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      print(signincontroller.emailController.value.text);
                      print(signincontroller.passwordController.value.text);
                      signincontroller.emailController.value.clear();
                      signincontroller.passwordController.value.clear();
                      setState(() {
                        isChecked = false;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 68, 87, 255),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 16, fontFamily: 'Bold'),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        // color: Color.fromARGB(255, 112, 122, 129),
                        color: Color.fromARGB(255, 151, 158, 163),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SemiBold',
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color.fromARGB(255, 68, 87, 255),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Bold',
                        ),
                      ),
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: "This Functionality Unavailable",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black45,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        indent: 20.0,
                        endIndent: 10.0,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Or Sign in with",
                      style: TextStyle(
                        color: Color.fromARGB(255, 174, 181, 184),
                        fontFamily: 'Bold',
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        indent: 10.0,
                        endIndent: 20.0,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: "This Functionality Unavailable",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black45,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Image.asset(
                          "assets/images/google.png",
                          height: 30,
                          width: 50,
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                    GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: "This Functionality Unavailable",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black45,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Image.asset(
                          "assets/images/apple.png",
                          height: 30,
                          width: 50,
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                    GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: "This Functionality Unavailable",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black45,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Image.asset(
                          "assets/images/facebook.png",
                          height: 30,
                          width: 50,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "By Signing up you agree to our ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 146, 154, 159),
                        fontFamily: 'SemiBold',
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        "Terms",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Bold',
                        ),
                      ),
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: "This Functionality Unavailable",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black45,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "and ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 146, 154, 159),
                        fontFamily: 'SemiBold',
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        "Conditions of Use ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Bold',
                        ),
                      ),
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: "This Functionality Unavailable",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black45,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
