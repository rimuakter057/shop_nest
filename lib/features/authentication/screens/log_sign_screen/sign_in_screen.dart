
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_nest/features/authentication/screens/log_sign_screen/sign_up_screen.dart';
import 'package:shop_nest/features/authentication/screens/team_list_screen/team_list_screen.dart';
import 'package:shop_nest/utils/toast_message/toast_message.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = "/sign-in-screen";
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    void login(){
      _auth.signInWithEmailAndPassword(email: _emailController.text.toString(),
      password: _passwordController.text.toString()).then((value){
        Message().tosastMessage(value.user!.email.toString());
      }).onError((error, stackTrace){
        debugPrint( "===========${error.toString()}");
        Message().tosastMessage(error.toString());
      });
    }
  @override
  Widget build(BuildContext context) {
    Widget gap = SizedBox(height: 15,);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          SizedBox(height: 80,),
              Text("sign in screen"),
              gap,
              Form(
                key: _formKey,
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                      ),
                      validator: validateEmail,
                    ),
                    gap,
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                      ),
                      validator: validatePassword,
                    ),
                  ],
                                ),
                ),
              ),
           gap,
           ElevatedButton(onPressed: (){
             if(_formKey.currentState!.validate()){
               clearForm();
           Navigator.push(context, MaterialPageRoute(builder: (_) => TeamListScreen()));

             }
           }, child: Text("sign in")),
           TextButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen()));
           }, child:     Text("Signup"),)

            ],
          ),
        ),
      ),
    );
  }


  //pass validator
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'enter a password';
    } else if (value.length < 6) {
      return 'password must be at least 6 characters';
    }
    return null;
  }
//email validator
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'enter an email';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'enter a valid email';
    }
    return null;
  }
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  void clearForm() {
    _emailController.clear();
    _passwordController.clear();
  }
}
