import 'package:flutter/material.dart';
import 'signin_screen.dart';
import 'forgotpws_screen.dart';
import 'mainmenu_screen.dart';
// Pastikan ProfileScreen diimport
import '../database/database_instance.dart';
import '../models/pengguna.dart';
import '../globals/globals.dart'; // Import globals.dart

class PasswordScreen extends StatelessWidget {
  PasswordScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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

  void _navigateToMainMenu(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email dan Password tidak boleh kosong')),
      );
      return;
    }

    try {
      List<Pengguna> penggunaList =
          await DatabaseInstance.instance.getPengguna();
      bool isValidUser = penggunaList.any((pengguna) =>
          pengguna.email == email && pengguna.password == password);

      if (isValidUser) {
        // Get the logged in user
        Pengguna loggedInUser = penggunaList.firstWhere((pengguna) =>
            pengguna.email == email && pengguna.password == password);

        // Save the logged in user's username and email to globals
        loggedInUsername = loggedInUser.username;
        loggedInEmail = loggedInUser.email;

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  const MainmenuScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email atau Password Salah')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error Validating User: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(129, 212, 105, 1.000),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email Input
            _buildInputField(
              controller: emailController,
              hintText: 'Email',
              prefixIcon: Icons.email,
              obscureText: false,
            ),
            const SizedBox(height: 16.0),
            // Password Input
            ValueListenableBuilder<bool>(
              valueListenable: _obscureText,
              builder: (context, obscureText, child) {
                return _buildInputField(
                  controller: passwordController,
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                  obscureText: obscureText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black54,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            // Remember Me Checkbox
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
            // Forgot Password Button
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
            // Login Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _navigateToMainMenu(context),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 5,
                  backgroundColor: Colors.green,
                  shadowColor: Colors.black.withOpacity(0.25),
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
            const SizedBox(height: 16.0),
            // Register Button
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
            const SizedBox(height: 32.0),
            // Logo Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/tahura3.png', height: 40.0),
                const SizedBox(width: 20.0),
                Image.asset('assets/likmidn.png', height: 40.0),
                const SizedBox(width: 20.0),
                Image.asset('assets/turisbg.png', height: 40.0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon, color: Colors.black54),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black54),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
