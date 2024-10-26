import 'package:flutter/material.dart';
import 'package:lejit/constants/colors.dart';
import 'package:lejit/pages/auth/signup_page.dart';
import 'package:lejit/pages/auth/forgot_password_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false; // To toggle password visibility
  bool _isRememberMe = false; // To track Remember Me switch

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set app background color as #f4f5f9
      backgroundColor: const Color.fromARGB(255, 244, 245, 249),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                // App Logo
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: navyBlue,
                  child: Icon(
                    Icons.gavel,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                // App Title
                const Text(
                  'Lawyer App',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40),
                // Sign In Text
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Email Input
                TextField(
                  decoration: InputDecoration(
                    // white fill color
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: 'abc@email.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Password Input with eye toggle
                TextField(
                  obscureText: !_isPasswordVisible, // Toggle visibility
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    hintText: 'Your password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible =
                              !_isPasswordVisible; // Toggle the state
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Remember Me & Forgot Password Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Switch(
                          value: _isRememberMe, // Track state
                          onChanged: (value) {
                            setState(() {
                              _isRememberMe = value; // Update state
                            });
                          },
                          activeColor: navyBlue,
                        ),
                        const Text(
                          'Remember Me',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle Forgot Password
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen(),
                          ),
                        );

                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 12,
                          color: navyBlue,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Sign In Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Sign In
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: navyBlue,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'SIGN IN',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // OR Divider
                const Text(
                  'OR',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                // Social Login Buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Handle Google Sign In
                    },
                    icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red),

                    label: const Text('Login with Google'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Handle Facebook Sign In
                    },
                    icon: const Icon(Icons.facebook, color: navyBlue),
                    label: const Text('Login with Facebook'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Sign Up Link
                GestureDetector(
                  onTap: () {
                    // Handle Sign Up Navigation
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpPage(role: "Lawyer",))
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: navyBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
