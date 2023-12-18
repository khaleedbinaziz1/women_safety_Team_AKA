import 'package:flutter/material.dart';
import 'package:women_safety_app/components/CustomTextField.dart';
import 'package:women_safety_app/components/PrimaryButton.dart';
import 'package:women_safety_app/components/SecondaryButton.dart';
import 'package:women_safety_app/parent/parent_register_screen.dart';
import 'package:women_safety_app/utils/constants.dart';
import 'package:women_safety_app/child/register_child.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordShown = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};

  void onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      print(_formData['email']);
      print(_formData['password']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "User Login",
                  style: TextStyle(fontSize: 40, color: Color(0xfffc3b77)),
                ),
                Image.asset(
                  'assets/logo.png',
                  height: 100,
                  width: 100,
                ),
                CustomTextField(
                  hintText: 'enter email',
                  textInputAction: TextInputAction.next,
                  keyboardtype: TextInputType.emailAddress,
                  prefix: Icon(Icons.person),
                  onsave: (email) {
                    _formData['email'] = email ?? "";
                  },
                  validate: (email) {
                    if (email!.isEmpty ||
                        email.length < 3 ||
                        !email.contains("@")) {
                      return 'enter correct email';
                    }
                  },
                ),
                CustomTextField(
                  hintText: 'enter password',
                  isPassword: isPasswordShown,
                  prefix: Icon(Icons.vpn_key_rounded),
                  validate: (password) {
                    if (password!.isEmpty || password.length < 7) {
                      return 'enter correct password';
                    }
                    return null;
                  },
                  onsave: (password) {
                    _formData['password'] = password ?? "";
                  },
                  suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordShown = !isPasswordShown;
                        });
                      },
                      icon: isPasswordShown
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility)),
                ),
                PrimaryButton(
                    title: 'LOGIN',
                    onPressed: () {
                      // progressIndicator(context);
                      if (_formKey.currentState!.validate()) {
                        onSubmit();
                      }
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(fontSize: 18),
                    ),
                    SecondaryButton(title: 'click Here', onPressed: () {}),
                  ],
                ),
                SecondaryButton(
                  title: 'Register as a child',
                  onPressed: () {
                    goTo(context, RegisterChildScreen());
                  },
                ),
                SecondaryButton(
                  title: 'Register as a Parent',
                  onPressed: () {
                    goTo(context, RegisterParentScreen());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
