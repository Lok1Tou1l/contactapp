import 'dart:typed_data';

abstract class UserRepository {
  const UserRepository();

  Future<void> login({required String email, required String password});

  Future<void> register(
      {required String username,
      required String email,
      required String password,
      required Uint8List file});

  logout();
}
