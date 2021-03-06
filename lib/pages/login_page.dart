import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:app_sistema_ventas/widgets/login_controller.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) {
          return SingleChildScrollView(
            child: Form(
                key: controller.formKey,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          child: const Text(
                            'Login Page',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          alignment: Alignment.center,
                        ),
                        SizedBox(
                          height: 50,
                        ),

                        Container(
                          child: const Text(
                            'Email de prueba: ejemplo@uta.edu.com - Hola#1',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          alignment: Alignment.center,
                        ),
                        SizedBox(
                          height: 50,
                        ),

                        TextFormField(
                          controller: controller.emailController,
                          decoration: const InputDecoration(labelText: 'Email'),
                          validator: (String? value) {
                            if (value!.isEmpty)
                              return 'Please enter some text'; //*****
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: controller.passwordController,
                          decoration: const InputDecoration(labelText: 'Password'),
                          validator: (String? value) {
                            if (value == "")
                              return 'Please enter some text or numbers';
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 16.0),
                          alignment: Alignment.center,
                          child: SignInButton(
                            Buttons.Email,
                            text: "VFDI - Iniciar Sesion",
                            onPressed: () async {
                              _.signInWithEmailAndPassword(context);
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 16.0),
                          alignment: Alignment.center,
                          child: SignInButton(
                            Buttons.Email,
                            text: "VFDI - Registarse",
                            onPressed: () async {
                              registerUserVFDI(context);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
