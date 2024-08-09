// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/auth_controller.dart';
// import '../routes/routes.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
   final AuthController _authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  final isLoading = false;
    final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();

  
  bool _obscurePassword = true;
  bool isSwitched = false;
   bool isSwitchedValidated = true;
  String errorText = " ";

  void _submit(){
    final isValid = _formKey.currentState?.validate();

    if(isValid!){
      setState(()=>errorText = " ");
      _authController.register();
      if (_authController.user.value != null) {
        //  Get.toNamed('/home');

       }
    //    _formKey.currentState?.save();
    //  Get.toNamed(Routes.homeScreenRoute);
      return;
    }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: GetBuilder<AuthController>(
          init: Get.find<AuthController>(),
          builder: (controller) => SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 50.0),
        child: Center(
          child: Card(
            elevation:20,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                        const Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller:controller.emailController,
                    focusNode: _focusNodeEmail,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                        return " enter a valid email";
                      }
                      return null;
                    },
                    onEditingComplete: () => _focusNodePassword.requestFocus(),
                  ),
                                const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: _obscurePassword,
                    focusNode: _focusNodePassword,
                      keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.password_outlined),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: _obscurePassword
                              ? const Icon(Icons.visibility_outlined)
                              : const Icon(Icons.visibility_off_outlined)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator:(value){
                      if(value!.isEmpty || !RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%*&_-])[A-Za-z\d!@#$%*&_-]{8,24}$').hasMatch(value)){
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    }
                  ),
                Text(
                  _authController.errorMessage.value,
                  style: TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 35),
                ElevatedButton(
                    onPressed: (){_submit();},
                     style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6C63FF),
                        minimumSize: const Size(100, 20),
                        foregroundColor: Colors.red,
                        elevation:10,
                        alignment: Alignment.center,
                        padding:  const EdgeInsets.all(15)
                      ),
                      child: const Text("Sign up",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),),
                  ),
                  const SizedBox(height: 25),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.grey)
                            )
                          ),
                          backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                        ),
                        child: const Text("Login",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      ),
            ],
            ),
          ),
        ),
      ),
        )
      )
    );
  }
}