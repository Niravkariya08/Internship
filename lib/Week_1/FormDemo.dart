import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship/Week_1/FormDemocontroller.dart';

class Formdemo extends StatefulWidget {
  const Formdemo({super.key});

  @override
  State<Formdemo> createState() => _FormdemoState();
}

class _FormdemoState extends State<Formdemo> {
  // TextEditingController firstnameController = TextEditingController();
  // TextEditingController lastnameController = TextEditingController();
  // TextEditingController phonenoController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // TextEditingController conpasswordController = TextEditingController();

  final Formdemocontroller filecontroller = Get.put(Formdemocontroller());
  @override
  void dispose() {
    super.dispose();
    Get.delete<Formdemocontroller>();
  }

  final formkey = GlobalKey<FormState>();

  bool passwordVisible = false;
  bool conpasswordVisible = false;

  String gender = "";

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registration Form",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Container(
            // color: Colors.lightBlueAccent.shade100,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/logo.jpg",
                        height: 60,
                        width: 60,
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Brine Web",
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: filecontroller.firstnameController.value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: "First Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Your Name";
                      } else if (!RegExp(r"^[A-Za-z\s.'-]+$").hasMatch(value)) {
                        return "Write Name Properly Only Alphabet";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: filecontroller.lastnameController.value,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: "Last Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Your Name";
                      } else if (!RegExp(r"^[A-Za-z\s.'-]+$").hasMatch(value)) {
                        return "Write Name Properly Only Alphabet";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: filecontroller.phonenoController.value,
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      counterText: "",
                      prefixIcon: Icon(Icons.phone_rounded),
                      border: OutlineInputBorder(),
                      labelText: "Mobile Number",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Your Number";
                      } else if (!RegExp(
                        r'^(?:[+0]9)?[0-9]{10}$',
                      ).hasMatch(value)) {
                        return "Write Number Properly";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 14),
                  Row(
                    children: [
                      Text("Gender", style: TextStyle(fontSize: 16)),
                      SizedBox(width: 20),
                      Radio(
                        // title: Text("Male"),
                        value: 'Male',
                        groupValue: gender,
                        onChanged: (String? value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                      Text("Male", style: TextStyle(fontSize: 16)),
                      SizedBox(width: 20),
                      Radio(
                        // title: Text("Female"),
                        value: 'Female',
                        groupValue: gender,
                        onChanged: (String? value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                      Text("Female", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 14),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: filecontroller.emailController.value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_rounded),
                      border: OutlineInputBorder(),
                      labelText: "Email",
                    ),
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
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    obscureText: !passwordVisible,
                    controller: filecontroller.passwordController.value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
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
                      border: OutlineInputBorder(),
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    obscureText: !conpasswordVisible,
                    controller: filecontroller.conpasswordController.value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            conpasswordVisible = !conpasswordVisible;
                          });
                        },
                        icon: Icon(
                          conpasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      border: OutlineInputBorder(),
                      labelText: "Confirm Password",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Confirm Password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          "You may use the App only for lawful purposes. You agree not to engage in any activity that may harm, disrupt, or interfere with the functioning of the App or its users.",
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            if (filecontroller.passwordController.value.text ==
                                filecontroller
                                    .conpasswordController
                                    .value
                                    .text) {
                              if (isChecked == true) {
                                if (formkey.currentState!.validate()) {
                                  print(
                                    filecontroller
                                        .firstnameController
                                        .value
                                        .text,
                                  );
                                  print(
                                    filecontroller
                                        .lastnameController
                                        .value
                                        .text,
                                  );
                                  print(
                                    filecontroller.phonenoController.value.text,
                                  );
                                  print(
                                    filecontroller.emailController.value.text,
                                  );
                                  print(
                                    filecontroller
                                        .passwordController
                                        .value
                                        .text,
                                  );
                                  print(
                                    filecontroller
                                        .conpasswordController
                                        .value
                                        .text,
                                  );
                                  print(gender);
                                  filecontroller.firstnameController.value
                                      .clear();
                                  filecontroller.lastnameController.value
                                      .clear();
                                  filecontroller.phonenoController.value
                                      .clear();
                                  filecontroller.emailController.value.clear();
                                  filecontroller.passwordController.value
                                      .clear();
                                  filecontroller.conpasswordController.value
                                      .clear();
                                  gender = "";
                                  isChecked = false;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Form Submitted Successfully",
                                      ),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Accept Terms And Condition"),
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Both Password Not Match"),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            filecontroller.firstnameController.value.clear();
                            filecontroller.lastnameController.value.clear();
                            filecontroller.phonenoController.value.clear();
                            filecontroller.emailController.value.clear();
                            filecontroller.passwordController.value.clear();
                            filecontroller.conpasswordController.value.clear();
                            gender = "";
                            isChecked = false;
                            if (formkey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Form Reset Successfully"),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Form is Already Clean"),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Reset",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
