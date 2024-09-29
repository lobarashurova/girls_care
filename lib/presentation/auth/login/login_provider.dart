import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:girls_care/common/di/injection.dart';
import 'package:girls_care/data/storage/storage.dart';

import '../../../data/user_model.dart';

class LoginProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final storage = getIt<Storage>();
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

      if (userSnapshot.docs.isNotEmpty) {
        DocumentSnapshot userDoc = userSnapshot.docs.first;
        _user = UserModel(
          phone: userDoc['phone'],
          password: userDoc['password'],
        );
        storage.enabled.set(true);
        storage.phone.set(userDoc['phone']);
        storage.password.set(userDoc['password']);

        print("login found=============================\n====");

        _errorMessage = null;
      } else {
        _errorMessage = 'Iltimos, maydonlarni tekshiring!';
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
