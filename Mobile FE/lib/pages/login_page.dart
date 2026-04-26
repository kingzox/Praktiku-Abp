import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../kerangka/login_kerangka.dart'; 

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- 1. HEADER ---
                LoginKerangka.headerSection(),
                const SizedBox(height: 40),

                // --- 2. FORM INPUT ---
                LoginKerangka.inputField(
                  label: "Email Kampus",
                  hint: "email@ittelkom-pwt.ac.id",
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 20),
                
                LoginKerangka.inputField(
                  label: "Password",
                  hint: "Masukkan password kamu",
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                
                // Lupa Password Link (Opsional, taruh langsung di sini karena pendek)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Lupa Password?", style: TextStyle(color: AppTheme.greyText, fontSize: 12)),
                  ),
                ),
                const SizedBox(height: 30),

                // --- 3. TOMBOL LOGIN ---
                LoginKerangka.loginButton(
                  onPressed: () {
                    // Nanti logika login ke API Laravel masuk ke sini!
                    print("Tombol Login ditekan!");
                  },
                ),
                const SizedBox(height: 40),

                // --- 4. FOOTER (REGISTER) ---
                LoginKerangka.footerText(
                  onRegisterPressed: () {
                    // Navigasi ke halaman Register
                    print("Pindah ke halaman Register!");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}