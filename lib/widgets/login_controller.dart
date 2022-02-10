import 'package:app_sistema_ventas/models/user_modelVFDI.dart';
import 'package:app_sistema_ventas/pages/page_home.dart';
import 'package:app_sistema_ventas/pages/register_login_page.dart';
import 'package:app_sistema_ventas/services/user_serviceVFDI.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  ServiceUser serviceUser = new ServiceUser();
  List<userModelVFDI>? Users = [];

  void signInWithEmailAndPassword(BuildContext context) {
    String user = emailController.text.toString();
    String password = passwordController.text.toString();
    serviceUser.initialiase();
    serviceUser
        .userVFDI(user)
        .then((value) => {Users = value.cast<userModelVFDI>()});
    if (Users!.isNotEmpty) {
      if (Users![0].contrase == password) {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => MyHomePage(title: 'Inicio')));
      }
    }
  }

  

  void _signOut() async {
    await _auth.signOut();
  }

  void signOut() async {
    final User user = await _auth.currentUser!;
    if (user == null) {
      Get.snackbar('Out', 'No one has signed in.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    _signOut();
    final String uid = user.uid;
    Get.snackbar('Out', uid + 'has successfully signed out.',
        snackPosition: SnackPosition.BOTTOM);
    Get.toNamed("/home");
  }
}


void registerUserVFDI(BuildContext context) async {

  try{
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => RegisterLoginPage()));

  } catch (e) {
      Get.snackbar('Fallo', 'Ingreso Incorrecto!',
          snackPosition: SnackPosition.BOTTOM);
    }
}






    

  
