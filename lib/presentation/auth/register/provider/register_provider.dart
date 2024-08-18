import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:girls_care/data/api_model/register_data/register_data.dart';

class RegisterProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _errorMessage;
  bool _isRegistering = false;

  String? get errorMessage => _errorMessage;

  bool get isRegistering => _isRegistering;

  Future<void> registerUser(RegisterUserData userData) async {
    _isRegistering = true;
    notifyListeners();

    try {
      QuerySnapshot userSnapshot = await _firestore
          .collection('users')
          .where('phone', isEqualTo: userData.phone)
          .limit(1)
          .get();

      if (userSnapshot.docs.isNotEmpty) {
        _errorMessage = 'Phone number already registered';
      } else {
        await _firestore.collection('users').add({
          'phone': userData.phone,
          'password': userData.password,
        });
        _errorMessage = null;
        _isRegistering = false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred: ${e.toString()}';
    } finally {
      _isRegistering = false;
      notifyListeners();
    }
  }
}
