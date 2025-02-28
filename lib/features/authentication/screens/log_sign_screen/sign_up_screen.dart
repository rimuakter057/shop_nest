
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_nest/features/authentication/screens/log_sign_screen/sign_in_screen.dart';
import 'package:shop_nest/utils/toast_message/toast_message.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

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
              Text("sign up screen"),
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
              ElevatedButton(onPressed: ()
              {
             login();
              },
                  style: ElevatedButton.styleFrom(
                    fixedSize:const Size.fromWidth(double .maxFinite),
                  ),
                  child:_isLoading? CircularProgressIndicator(strokeWidth: 3,): Text("sign up")),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => SignInScreen()));
              }, child:     Text("SignIn"),)

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

  void clearForm() {
    _emailController.clear();
    _passwordController.clear();
  }
  void login(){
    if(_formKey.currentState!.validate()){
      setState(() {
        _isLoading = true;
      });
      _auth.createUserWithEmailAndPassword(email: _emailController.text.toString(),
          password: _passwordController.text.toString()).then((value){
        setState(() {
          _isLoading = false;
        });
      }).onError((error, stackTrace){
        Message().tosastMessage(error.toString());
        setState(() {
          _isLoading = false;
        });
      });
      clearForm();
      print("============success=============");
    }
  }
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
