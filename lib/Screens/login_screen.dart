// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/login_controller.dart';
import '../Routes/routes.dart';
// import '../routes/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final LoginController _LoginController = Get.put(LoginController());
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
      _LoginController.login();
      if (_LoginController.user.value != null) {
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
        resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body:  Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: GetBuilder<LoginController>(
          init: Get.find<LoginController>(),
          builder: (controller) => Container(
            height:MediaQuery.of(context).size.height,
            color: Color(0xFFF3F3F3),
        padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 00.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation:20,
                child: Container(
                 decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8) 
                  ),
                  padding: EdgeInsets.symmetric(horizontal:20, vertical: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                              const Text(
                                "Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
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
                                      const SizedBox(height: 10),
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
                            if(value!.isEmpty || value.length <6){
                              return "Password must be alphaNumeric with special characters";
                            }
                            return null;
                          }
                        ),
                      Text(
                        _LoginController.errorMessage.value,
                        style: TextStyle(color: Colors.red),
                      ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: (){_submit();},
                           style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              minimumSize: const Size(100, 20),
                              foregroundColor: Colors.red,
                              elevation:10,
                              alignment: Alignment.center,
                              padding:  const EdgeInsets.all(15)
                            ),
                            child: const Text("Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),),
                        ),
                        const SizedBox(height: 10),
                            TextButton(
                              onPressed: () { Get.toNamed(Routes.signupScreenRoute);},
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  )
                                ),
                                backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                              ),
                              child: const Text("Sign up",
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
            ],
          ),
        ),
      ),
        )
    );
  }
}