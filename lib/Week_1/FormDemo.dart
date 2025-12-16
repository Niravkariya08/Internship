import 'package:flutter/material.dart';

class Formdemo extends StatefulWidget {
  const Formdemo({super.key});

  @override
  State<Formdemo> createState() => _FormdemoState();
}

class _FormdemoState extends State<Formdemo> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conpasswordController = TextEditingController();

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
                    controller: firstnameController,
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
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: lastnameController,
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
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: phonenoController,
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
                    controller: emailController,
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
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    obscureText: !passwordVisible,
                    controller: passwordController,
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
                    controller: conpasswordController,
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
                            if (passwordController.text ==
                                conpasswordController.text) {
                              if (isChecked == true) {
                                if (formkey.currentState!.validate()) {
                                  print(firstnameController.text);
                                  print(lastnameController.text);
                                  print(phonenoController.text);
                                  print(emailController.text);
                                  print(passwordController.text);
                                  print(conpasswordController.text);
                                  print(gender);
                                  firstnameController.clear();
                                  lastnameController.clear();
                                  phonenoController.clear();
                                  emailController.clear();
                                  passwordController.clear();
                                  conpasswordController.clear();
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
                            firstnameController.clear();
                            lastnameController.clear();
                            phonenoController.clear();
                            emailController.clear();
                            passwordController.clear();
                            conpasswordController.clear();
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
