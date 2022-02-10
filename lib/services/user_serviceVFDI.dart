
import 'package:app_sistema_ventas/models/user_modelVFDI.dart';
import 'package:app_sistema_ventas/pages/page_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_sistema_ventas/models/products_model.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';

class ServiceUser {
  FirebaseFirestore? database;
  initialiase() {
    database = FirebaseFirestore.instance;
  }

  Future<List> userVFDI(String userName) async {
    List docs = [];
    QuerySnapshot querySnapshot;
    try {
      querySnapshot = await database!.collection('Usuarios').get();
      print('llega');
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs) {
          userModelVFDI? user;
          if (userName == doc['usuario']) {
            user = userModelVFDI(
                doc.id, doc['usuario'], doc['password'], doc['cedula']);
            docs.add(user);
          }
          print(doc['usuario']);
        }
      }
      //print(prods);
    } catch (e) {
      print("Error");
    }
    return docs;
  }


  Future<List> crearUserVFDI(String userName) async {
    List docs = [];
    QuerySnapshot querySnapshot;
    try {
      querySnapshot = await database!.collection('Usuarios').get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs) {
          userModelVFDI? user;
          if (userName == doc['usuario']) {
            user = userModelVFDI(
                doc.id, doc['usuario'], doc['password'], doc['cedula']);
            docs.add(user);
          }
          print(doc['usuario']);
        }
      }
      
    } catch (e) {
      print("Error");
    }
    return docs;
  }
}
