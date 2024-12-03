import 'package:flutter/material.dart';
import 'package:myapp/screens/password_screen.dart';

void main() {
  runApp(const TahuraApp());
}

class TahuraApp extends StatelessWidget {
  const TahuraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ForgotpwsScreen(),
    );
  }
}

class ForgotpwsScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  ForgotpwsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(129, 212, 105, 1.000),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Kembali ke layar sebelumnya
          },
        ),
        title: const Center(
          child: Text(
            'FORGOT PASSWORD',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // UserName Field
              _buildTextField(
                controller: usernameController,
                label: 'UserName',
                obscureText: false,
              ),
              const SizedBox(height: 16),
              
              // Email Field
              _buildTextField(
                controller: emailController,
                label: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 16),
              
              // New Password Field
              _buildTextField(
                controller: newPasswordController,
                label: 'New Password',
                obscureText: true,
              ),
              const SizedBox(height: 16),
              
              // Confirm Password Field
              _buildTextField(
                controller: confirmPasswordController,
                label: 'Confirm New Password',
                obscureText: true,
              ),
              const SizedBox(height: 24),
              
              // Save Button
              ElevatedButton(
                onPressed: () {
                  String username = usernameController.text;
                  String email = emailController.text;
                  String newPassword = newPasswordController.text;
                  String confirmPassword = confirmPasswordController.text;

                  if (newPassword != confirmPassword) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Passwords do not match!')),
                    );
                    return;
                  }

                  // Placeholder for sending data to the database
                  // Uncomment and modify the following lines when the database is ready
                  /*
                  try {
                    await DatabaseService.updatePassword(
                      username: username,
                      email: email,
                      newPassword: newPassword,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Password updated successfully!')),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => PasswordScreen()),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error updating password: $e')),
                    );
                  }
                  */

                  // Temporary success navigation until the database is integrated
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PasswordScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'SAVE',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      ),
    );
  }
}
