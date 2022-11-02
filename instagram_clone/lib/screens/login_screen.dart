import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/util/colors.dart';
import 'package:instagram_clone/widget/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              //svg containing instagram
              SvgPicture.asset(
                "assets/svg/ic_instagram.svg",
                color: primaryColor,
                height: 64,
              ),

              const SizedBox(height: 64),

              //email textbutton
              TextFieldInput(
                textEditingController: _emailController,
                hinttext: "Phone number, email address or username",
                textInputType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 21),
              //password textbutton
              TextFieldInput(
                textEditingController: _passwordController,
                hinttext: "Password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 32),

              //sign in button
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                width: double.infinity,
                alignment: Alignment.center,
                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.blue),

                decoration: ShapeDecoration(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: const Text("Log in"),
              ),

              const SizedBox(height: 21),

              const Divider(
                height: 2,
                color: Colors.grey,
              ),
              const SizedBox(height: 21),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Sign up.",
                    style: TextStyle(color: Colors.blue[700]),
                  ),
                ],
              )
              //signup
            ],
          ),
        ),
      ),
    );
  }
}
