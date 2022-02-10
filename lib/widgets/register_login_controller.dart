import 'package:app_sistema_ventas/models/user_modelVFDI.dart';
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

  Future<SignUpResponse> register() async {
    try{
    final UserCredential = await _auth.createUserWithEmailAndPassword(
      
      email: emailController.text,
      password: passwordController.text,
      //cedulaDIVF: cedulaControllerVFDI.text,
    );
    return SignUpResponse(null, UserCredential.user!);
  }on FirebaseAuthException catch (e) {
    return SignUpResponse(e.code, null);
  }
  }
}