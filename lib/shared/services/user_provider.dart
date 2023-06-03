import 'package:flutter/widgets.dart';
import 'package:contactapp/data/models/user_model.dart';
import 'package:contactapp/data/repositories/firebase_auth.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final FirebaseAuthRepo _authRepo = FirebaseAuthRepo();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authRepo.getUserDetails();
    _user = user;
    notifyListeners();
  }
}