// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/signup_controller.dart';
import '../Routes/routes.dart';
// import '../routes/routes.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
   final SignupController _SignupController = Get.put(SignupController());
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
      _SignupController.register();
      if (_SignupController.user.value != null) {
        //  Get.toNamed('/home');
     Get.offAndToNamed(Routes.loginScreenRoute);

       }
    //    _formKey.currentState?.save();
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
        child: GetBuilder<SignupController>(
          init: Get.find<SignupController>(),
          builder: (controller) => Container(
            height:MediaQuery.of(context).size.height*0.8,
            color: Color(0xFFF3F3F3),
        padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Card(
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
                            "Sign up",
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
                        if(value!.isEmpty || !RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%*&_-])[A-Za-z\d!@#$%*&_-]{8,24}$').hasMatch(value)){
                          return "Password must be alphaNumeric with special characters";
                        }
                        return null;
                      }
                    ),
                  Text(
                    _SignupController.errorMessage.value,
                    textAlign: TextAlign.center,
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
                        child: controller.isLoading.value == true ?
                          CircularProgressIndicator() :
                          const Text("Sign up",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ))
                    ),
                    const SizedBox(height: 10),
                        TextButton(
                          onPressed: () { Get.offAndToNamed(Routes.loginScreenRoute);},
                          style: ButtonStyle(
                              elevation:WidgetStateProperty.all<double>(30.0),
                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
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
          )
          ],
        ),
      ),
        )
      )
    );
  }
}