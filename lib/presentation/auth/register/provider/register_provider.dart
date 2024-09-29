import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:girls_care/common/di/injection.dart';
import 'package:girls_care/data/api_model/register_data/register_data.dart';
import 'package:girls_care/data/storage/storage.dart';

class RegisterProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _errorMessage;
  bool _isRegistering = false;

  String? get errorMessage => _errorMessage;

  bool get isRegistering => _isRegistering;
  final storage = getIt<Storage>();

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
        _errorMessage = "Telefon raqam allaqachon ro'yxatdan o'tgan";
      } else {
        await _firestore.collection('users').add({
          'phone': userData.phone,
          'password': userData.password,
        });
        storage.enabled.set(true);
        _errorMessage = null;
        _isRegistering = false;
      }
    } catch (e) {
      _errorMessage = 'Xatolik yuz berdi: ${e.toString()}';
    } finally {
      _isRegistering = false;
      notifyListeners();
    }
  }
}
