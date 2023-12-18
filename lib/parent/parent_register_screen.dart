import 'package:flutter/material.dart';
import 'package:women_safety_app/components/CustomTextField.dart';
import 'package:women_safety_app/components/PrimaryButton.dart';
import 'package:women_safety_app/components/SecondaryButton.dart';
import 'package:women_safety_app/utils/constants.dart';
import 'package:women_safety_app/child/child_login_screen.dart';

class RegisterParentScreen extends StatefulWidget {
  @override
  State<RegisterParentScreen> createState() => _RegisterParentScreenState();
}

class _RegisterParentScreenState extends State<RegisterParentScreen> {
  bool isPasswordShown = true;
  bool isRetypePasswordShown = true;

  final _formKey = GlobalKey<FormState>();

  final _formData = Map<String, Object>();
  bool isLoading = false;

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      if (_formData['password'] != _formData['rpassword']) {
        dialogueBox(context, 'password and retype password should be equal');
      } else {}
      print(_formData['name']);
      print(_formData['phone']);
      print(_formData['cemail']);
      print(_formData['gemail']);
      print(_formData['password']);
      print(_formData['rpassword']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "REGISTER AS PARENT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/logo.png',
                height: 100,
                width: 100,
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextField(
                        hintText: 'enter name',
                        textInputAction: TextInputAction.next,
                        keyboardtype: TextInputType.name,
                        prefix: Icon(Icons.person),
                        onsave: (name) {
                          _formData['name'] = name ?? "";
                        },
                        validate: (name) {
                          if (name!.isEmpty || name.length < 3) {
                            return 'enter correct name';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        hintText: 'enter phone',
                        textInputAction: TextInputAction.next,
                        keyboardtype: TextInputType.phone,
                        prefix: Icon(Icons.phone),
                        onsave: (phone) {
                          _formData['phone'] = phone ?? "";
                        },
                        validate: (phone) {
                          if (phone!.isEmpty || phone.length < 10) {
                            return 'enter correct phone';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        hintText: 'enter email',
                        textInputAction: TextInputAction.next,
                        keyboardtype: TextInputType.emailAddress,
                        prefix: Icon(Icons.person),
                        onsave: (email) {
                          _formData['gemail'] = email ?? "";
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
                        hintText: 'enter child email',
                        textInputAction: TextInputAction.next,
                        keyboardtype: TextInputType.emailAddress,
                        prefix: Icon(Icons.person),
                        onsave: (gemail) {
                          _formData['cemail'] = gemail ?? "";
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
                          } else {
                            return null;
                          }
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
                              : Icon(Icons.visibility),
                        ),
                      ),
                      CustomTextField(
                        hintText: 'retype password',
                        isPassword: isRetypePasswordShown,
                        prefix: Icon(Icons.vpn_key_rounded),
                        validate: (password) {
                          if (password!.isEmpty || password.length < 7) {
                            return 'enter correct password';
                          } else {
                            return null;
                          }
                        },
                        onsave: (password) {
                          _formData['rpassword'] = password ?? "";
                        },
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              isRetypePasswordShown = !isRetypePasswordShown;
                            });
                          },
                          icon: isRetypePasswordShown
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                      ),
                      PrimaryButton(
                        title: 'REGISTER',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _onSubmit();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SecondaryButton(
                title: 'Login with your account',
                onPressed: () {
                  goTo(context, LoginScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
