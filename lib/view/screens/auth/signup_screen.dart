// TODO : build signup screenimport 'dart:typed_data';

import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:contactapp/data/repositories/firebase_auth.dart';
import 'package:contactapp/shared/utilities/utils.dart';
import 'package:contactapp/view/screens/auth/login_screen.dart';
import 'package:contactapp/shared/styles/themes.dart';
import 'package:contactapp/view/widgets/button_widget.dart';
import 'package:contactapp/view/widgets/navigation_widget.dart';
import 'package:contactapp/view/widgets/snackbar_widget.dart';
import 'package:contactapp/view/widgets/textfield_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sizer/sizer.dart';
import 'package:animate_do/animate_do.dart';
import 'package:contactapp/shared/utilities/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Form(
              key: _formKey,
              child: BounceInDown(
                duration: const Duration(milliseconds: 1500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 8.h,
                    // ),
                    Text('Hey !',
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 20.sp,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      'Create a New Account !',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 12.sp,
                            letterSpacing: 2,
                            // fontWeight: FontWeight.bold
                          ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  radius: 54,
                                  backgroundImage: MemoryImage(_image!),
                                  backgroundColor: Colors.redAccent,
                                )
                              : const CircleAvatar(
                                  radius: 54,
                                  backgroundImage: NetworkImage(
                                      'https://i.stack.imgur.com/l60Hf.png'),
                                  backgroundColor: Colors.redAccent,
                                ),
                          Positioned(
                            bottom: -10,
                            left: 70,
                            child: IconButton(
                              onPressed: selectImage,
                              icon: const Icon(Icons.add_a_photo),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    MyTextfield(
                      hint: 'Username',
                      icon: Icons.person,
                      keyboardtype: TextInputType.emailAddress,
                      validator: (value) {
                        return value!.length < 3 ? 'Unvalid Name' : null;
                      },
                      textEditingController: _nameController,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    MyTextfield(
                      hint: 'Email Address',
                      icon: Icons.email,
                      keyboardtype: TextInputType.emailAddress,
                      validator: (value) {
                        return !Validators.isValidEmail(value!)
                            ? 'Enter a valid email'
                            : null;
                      },
                      textEditingController: _emailController,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    MyTextfield(
                      hint: 'Password',
                      icon: Icons.password,
                      keyboardtype: TextInputType.text,
                      obscure: true,
                      validator: (value) {
                        return value!.length < 6
                            ? "Enter min. 6 characters"
                            : null;
                      },
                      textEditingController: _passwordController,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    ButtonWidget(
                        color: Colors.redAccent,
                        width: 80.w,
                        title: 'CREATE ACCOUNT',
                        func: () async {
                          bool isConnected =
                              await InternetConnectionChecker().hasConnection;

                          if (isConnected) {
                            if (!mounted) {
                              return;
                            }
                            await _signUpWithEmailAndPass(context);
                          } else {
                            MySnackBar.error(
                                message:
                                    'Please Check Your Interenet Connection',
                                color: Colors.redAccent,
                                context: context);
                          }
                        }),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an Account ?',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontSize: 8.sp, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: Text(
                            'Login',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                    fontSize: 9.sp,
                                    color:Colors.redAccent,
                                    fontWeight: FontWeight.bold),
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
      ),
    );
  }

  Future<void> _signUpWithEmailAndPass(context) async {
    if (_formKey.currentState!.validate()) {
      await FirebaseAuthRepo()
          .register(
              username: _nameController.text,
              email: _emailController.text,
              password: _passwordController.text,
              file: _image)
          .onError((error, stackTrace) => MySnackBar.error(
              message: error.toString(), color: Colors.redAccent, context: context));
      if (FirebaseAuth.instance.currentUser != null) {
        // Navigator.pop(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Navigation()));
      }
    }
  }
}
