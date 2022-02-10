import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginRegisterController extends GetxController{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cedulaControllerVFDI = TextEditingController();

  bool? success;
  String? userEmail = '';
  String? cedulaVFDI = '';


  void dispose(){

    emailController.dispose();
    passwordController.dispose();
    cedulaControllerVFDI.dispose();
    super.dispose();
  }

  void register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
      //cedulaDIVF: cedulaControllerVFDI.text,
    ))
        .user;
    if (user != null) {
        success = true;
        print ('Registro OK');
        Future.delayed(
          Duration(seconds: 2),
          (){
            Get.toNamed("/foodpage");
          },
        );
    } else {
      success = false;
    }
  }
}