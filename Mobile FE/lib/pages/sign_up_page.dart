import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../kerangka/sign_up_kerangka.dart';
import '../kerangka/login_kerangka.dart'; // Ambil tombol login & google dari sini

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Column(
              children: [
                // 1. HEADER
                SignUpKerangka.headerSection(() => Navigator.pop(context)),
                const SizedBox(height: 32),

                // 2. KARTU FORM DAFTAR
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 24, offset: const Offset(0, 10)),
                    ],
                  ),
                  child: Column(
                    children: [
                      SignUpKerangka.inputField(
                        label: "Email Address",
                        hint: "name@example.com",
                        icon: Icons.mail_outline,
                      ),
                      const SizedBox(height: 20),
                      SignUpKerangka.inputField(
                        label: "Password",
                        hint: "........",
                        icon: Icons.lock_outline,
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      SignUpKerangka.inputField(
                        label: "Confirm Password",
                        hint: "........",
                        icon: Icons.verified_user_outlined, // Ikon perisai
                        isPassword: true,
                        suffixIcon: Icons.visibility_outlined, // Ikon mata
                      ),
                      const SizedBox(height: 32),

                      // TOMBOL DAFTAR
                      LoginKerangka.primaryButton("Daftar Akun Baru", () {}),
                      const SizedBox(height: 24),

                      // DIVIDER
                      LoginKerangka.dividerOr(),
                      const SizedBox(height: 24),

                      // GOOGLE BUTTON
                      LoginKerangka.googleButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}