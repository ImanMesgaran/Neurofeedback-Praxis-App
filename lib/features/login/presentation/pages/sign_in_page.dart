import 'package:flutter/material.dart';
import 'package:neurofeedback_praxis_app/features/events/presentation/pages/event_screen_page.dart';
import 'package:neurofeedback_praxis_app/features/login/presentation/pages/nav_bar_page.dart';
import 'package:neurofeedback_praxis_app/features/login/presentation/pages/sign_up_page.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF13202B), // Dark background color
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items to the left
          children: [
            SizedBox(height: 80), // Space from top
            Align(
              alignment: Alignment.centerLeft, // Align logo to the left
              child: Image.asset(
                'assets/images/banner.png', // Your FEG logo
                width: 350, // Adjusted size
              ),
            ),
            Spacer(),
            SizedBox(height: 80), // Space before input fields
            _buildTextField(label: "Email Address"),
            SizedBox(height: 16),
            _buildTextField(label: "PASSWORD", obscureText: true),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC1272D), // Red button
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "JOIN NOW!",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NavBarPage(),
                    ),
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Spacer(),
            Center(
              child: Image.asset(
                'assets/images/logo.png', // Your FEG logo
                width: 250, // Increased size to match reference design
              ),
            ),
            SizedBox(height: 80), // Space at the bottom
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
