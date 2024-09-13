import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../data/user_model.dart';

class LoginProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserModel? _user;
  String? _errorMessage;
  bool? _loading;

  UserModel? get user => _user;

  String? get errorMessage => _errorMessage;

  bool? get loading => _loading;

  Future<void> login(String phone, String password) async {
    print("login come=============================\n====");
    _loading = true;
    notifyListeners();
    try {
      QuerySnapshot userSnapshot = await _firestore
          .collection('users')
          .where('phone', isEqualTo: phone)
          .where('password', isEqualTo: password)
          .limit(1)
          .get();
      print("login found=============================\n====");


      if (userSnapshot.docs.isNotEmpty) {
        DocumentSnapshot userDoc = userSnapshot.docs.first;
        _user = UserModel(
          phone: userDoc['phone'],
          password: userDoc['password'],
        );
        _errorMessage = null;
      } else {
        _errorMessage = 'Invalid phone number or password';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: ${e.toString()}';
      print("===============${e.toString()}==\n=====");
    }
    _loading = false;
    notifyListeners();
  }

  void logout() {
    _user = null;
    _errorMessage = null;
    notifyListeners();
  }
}
