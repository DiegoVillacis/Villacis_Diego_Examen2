import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:app_sistema_ventas/widgets/register_login_controller.dart';

class RegisterLoginPage extends StatelessWidget {
  final controller = Get.put(LoginRegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginRegisterController>(
        builder: (_) {
          return Form(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _.emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _.passwordController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(labelText: 'Contraseña'),
                      /*inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^(?=.{10,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$')),
                      ],*/
                      validator: (value){

                        if(value!.isEmpty || RegExp(r'^(?=.{10,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$').hasMatch(value)){
                          return "Correcto";
                        }else{
                          return "Incorrecto";
                        }
                      },
                      
                    ),

                    TextFormField(
                      controller: _.cedulaControllerVFDI,
                      decoration: const InputDecoration(labelText: 'Cedula'),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 16.0),
                      alignment: Alignment.center,
                      child: RaisedButton(
                        child: Text('Register'),
                        onPressed: () async {
                          _.register();
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(_.success == null
                          ? ''
                          : (_.success!
                              ? 'Successfully registered $_.userEmail'
                              : 'Registration failed')),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
