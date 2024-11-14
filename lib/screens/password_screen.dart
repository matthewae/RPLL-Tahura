import 'package:flutter/material.dart';
import 'signin_screen.dart';
import 'forgotpws_screen.dart';
import 'mainmenu_screen.dart';
import 'adminlogin_screen.dart'; // Tambahkan ini

class PasswordScreen extends StatelessWidget {
  PasswordScreen({super.key});

  final ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _rememberMe = ValueNotifier<bool>(false);

  void _togglePasswordVisibility() {
    _obscureText.value = !_obscureText.value;
  }

  void _forgotPassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotpwsScreen()),
    );
  }

  void _register(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SigninScreen()),
    );
  }

  void _navigateToMainMenu(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainmenuScreen()),
    );
  }

  void _navigateToAdminLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AdminloginScreen()), // Halaman Admin
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: const TextStyle(color: Colors.black54),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ValueListenableBuilder<bool>(
                    valueListenable: _obscureText,
                    builder: (context, obscureText, child) {
                      return TextField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.black54),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 16.0),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black54,
                            ),
                            onPressed: _togglePasswordVisibility,
                          ),
                        ),
                        obscureText: obscureText,
                      );
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      ValueListenableBuilder<bool>(
                        valueListenable: _rememberMe,
                        builder: (context, rememberMe, child) {
                          return Checkbox(
                            value: rememberMe,
                            onChanged: (bool? value) {
                              _rememberMe.value = value ?? false;
                            },
                            activeColor: Colors.green,
                          );
                        },
                      ),
                      const Text(
                        'Remember Me',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => _forgotPassword(context),
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.green, Colors.teal],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(0, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () => _navigateToMainMenu(context),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () => _register(context),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0), // Tambahan jarak untuk tombol "Admin"
                  TextButton(
                    onPressed: () => _navigateToAdminLogin(context),
                    child: const Text(
                      'Admin',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/tahura3.png', height: 40.0),
                const SizedBox(width: 20.0),
                Image.asset('assets/likmidn.png', height: 40.0),
                const SizedBox(width: 20.0),
                Image.asset('assets/turisbg.png', height: 40.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
