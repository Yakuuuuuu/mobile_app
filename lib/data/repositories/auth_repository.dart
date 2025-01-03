import 'package:mobile_app/data/model/user_model.dart';

class AuthRepository {
  Future<UserModel> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Replace with actual API call
    if (email == "test@hamrobooking.com" && password == "password") {
      return UserModel(
        id: "1",
        name: "Test User",
        email: email,
      );
    } else {
      throw Exception("Invalid email or password");
    }
  }

  Future<UserModel> signup(String name, String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Replace with actual API call
    return UserModel(
      id: "2",
      name: name,
      email: email,
    );
  }
}
