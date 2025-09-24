import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../models/user.dart';

class AuthController extends GetxController {
  final _storage = const FlutterSecureStorage();
  final Rx<User?> _currentUser = Rx<User?>(null);
  final RxBool _isLoading = false.obs;

  User? get currentUser => _currentUser.value;
  bool get isLoading => _isLoading.value;

  Future<bool> login(String email, String password) async {
    try {
      _isLoading.value = true;
      
      // TODO: Implement actual API call
      await Future.delayed(const Duration(seconds: 2)); // Simulating API call
      
      // Simulated response
      if (email == 'manager@test.com' && password == '123456') {
        _currentUser.value = User(
          id: '1',
          name: 'Manager',
          email: email,
          role: UserRole.manager,
        );
        await _storage.write(key: 'user', value: _currentUser.value!.toJson().toString());
        return true;
      }
      
      return false;
    } catch (e) {
      return false;
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _storage.delete(key: 'user');
    _currentUser.value = null;
    Get.offAllNamed('/login');
  }

  Future<bool> checkAuth() async {
    try {
      final userData = await _storage.read(key: 'user');
      if (userData != null) {
        // TODO: Validate token with backend
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}