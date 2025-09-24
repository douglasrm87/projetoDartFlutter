import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Restaurante App',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 48),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                Obx(() => ElevatedButton(
                  onPressed: _authController.isLoading
                      ? null
                      : () async {
                          if (_emailController.text.isEmpty ||
                              _passwordController.text.isEmpty) {
                            Get.snackbar(
                              'Erro',
                              'Preencha todos os campos',
                              snackPosition: SnackPosition.BOTTOM,
                            );
                            return;
                          }

                          final success = await _authController.login(
                            _emailController.text,
                            _passwordController.text,
                          );

                          if (success) {
                            Get.offAllNamed('/home');
                          } else {
                            Get.snackbar(
                              'Erro',
                              'Email ou senha inválidos',
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: _authController.isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Entrar'),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}