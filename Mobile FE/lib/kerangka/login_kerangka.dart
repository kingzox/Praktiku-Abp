import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LoginKerangka {
  // 1. Kerangka Header (Teks Sambutan)
  static Widget headerSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome Back! 👋",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: AppTheme.darkText),
        ),
        SizedBox(height: 8),
        Text(
          "Silakan login dengan akun Telkom University Purwokerto kamu.",
          style: TextStyle(fontSize: 14, color: AppTheme.greyText, height: 1.5),
        ),
      ],
    );
  }

  // 2. Kerangka Input Field (Email & Password)
  static Widget inputField({
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.darkText, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            prefixIcon: Icon(icon, color: AppTheme.primaryPink, size: 20),
            filled: true,
            fillColor: AppTheme.lightGreyBg,
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  // 3. Kerangka Tombol Login
  static Widget loginButton({required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: AppTheme.primaryButton,
        child: const Text("LOGIN", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  // 4. Kerangka Footer (Belum Punya Akun?)
  static Widget footerText({required VoidCallback onRegisterPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Belum punya akun? ", style: TextStyle(color: AppTheme.greyText, fontSize: 14)),
        GestureDetector(
          onTap: onRegisterPressed,
          child: const Text(
            "Daftar di sini",
            style: TextStyle(color: AppTheme.primaryPink, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
      ],
    );
  }
}