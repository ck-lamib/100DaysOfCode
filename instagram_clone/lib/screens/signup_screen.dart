import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/util/colors.dart';
import 'package:instagram_clone/util/utils.dart';
import 'package:instagram_clone/widget/text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      userName: _userNameController.text,
      bio: _bioController.text,
      password: _passwordController.text,
      email: _emailController.text,
      file: _image!,
    );
    if (res != 'success') {
      showSnackBar(context, res);
    }

    setState(() {
      _isLoading = false;
    });
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
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          backgroundImage: MemoryImage(_image!),
                          radius: 45,
                        )
                      : const CircleAvatar(
                          backgroundColor: Colors.blue,
                          backgroundImage: NetworkImage(
                              "https://intlphotos.blob.core.windows.net/photos/np/de8f3fab-d81b-46a1-a42e-3f913b63b5a2.jpeg?0.855980300766803"),
                          radius: 45,
                        ),
                  Positioned(
                    child: IconButton(
                      onPressed: () => selectImage(),
                      icon: const Icon(Icons.add_a_photo),
                    ),
                    bottom: -10,
                    right: -10,
                  ),
                ],
              ),
              const SizedBox(height: 64),

              TextFieldInput(
                textEditingController: _userNameController,
                hinttext: "Username",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 21),
              //bio
              TextFieldInput(
                textEditingController: _bioController,
                hinttext: "Bio",
                textInputType: TextInputType.text,
              ),

              const SizedBox(height: 21),
              //email textbutton
              TextFieldInput(
                textEditingController: _emailController,
                hinttext: "Phone number or email address",
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
              InkWell(
                onTap: () => signUpUser(),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  width: double.infinity,
                  alignment: Alignment.center,
                  // decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.blue),

                  decoration: ShapeDecoration(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : const Text("Sign up"),
                ),
              ),

              const SizedBox(height: 21),
              Flexible(
                flex: 2,
                child: Container(),
              ),

              const Divider(
                height: 2,
                color: Colors.grey,
              ),
              const SizedBox(height: 21),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const LoginScreen();
                      },
                    )),
                    child: Text(
                      "Sign in.",
                      style: TextStyle(color: Colors.blue[700]),
                    ),
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
