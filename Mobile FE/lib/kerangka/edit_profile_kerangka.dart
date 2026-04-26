import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class EditProfileKerangka {
  static Widget _formLabel(String text) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.greyText, letterSpacing: 0.5),
    );
  }

  static Widget editHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "EDIT PERSONAL INFORMATION",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic, color: AppTheme.darkText, letterSpacing: -0.5),
        ),
        SizedBox(height: 8),
        Text(
          "Sesuaikan profilmu agar orang lain lebih mudah mengenalimu.",
          style: TextStyle(fontSize: 14, color: AppTheme.greyText, height: 1.5),
        ),
      ],
    );
  }

  static Widget editInputField({
    required String label,
    required IconData prefixIcon,
    required String hint,
    IconData? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _formLabel(label),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            prefixIcon: Icon(prefixIcon, color: Colors.grey, size: 20),
            suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: Colors.black45, size: 20) : null,
            filled: true,
            fillColor: AppTheme.lightGreyBg,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  static Widget editPhotoSection(String name) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: const BoxDecoration(
                shape: BoxShape.circle, 
                color: AppTheme.white, 
                boxShadow: [
                  // Error kedua sudah difix di sini (glowPink panggil dari AppTheme)
                  BoxShadow(color: AppTheme.glowPink, blurRadius: 40, spreadRadius: 10),
                ]
              ),
            ),
            Container(
              width: 130, height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle, 
                color: AppTheme.white, 
                border: Border.all(color: Colors.grey.shade100, width: 2), 
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5)),
                ]
              ),
              child: const Center(child: Icon(Icons.person_outline, size: 60, color: Colors.grey)),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: AppTheme.darkText, letterSpacing: -0.5)),
        const SizedBox(height: 6),
        const Text("UPDATE PHOTO", style: TextStyle(color: AppTheme.greyText, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
      ],
    );
  }
  
  // --- KERANGKA DROPDOWN MENU ATAS ---
  static Widget topDropdownMenu(BuildContext context) {
    return PopupMenuButton<String>(
      // Biar munculnya agak ke bawah 
      offset: const Offset(0, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: AppTheme.white,
      elevation: 4,
      // Tampilan yang diklik (Nama & Avatar Kecil dengan border pink)
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Admin Univent", style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.darkText, fontSize: 16)),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(2), // Jarak untuk efek border
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.primaryPink.withAlpha(100), width: 2), // Border pink tipis
            ),
            child: const CircleAvatar(
              radius: 18,
              backgroundColor: AppTheme.lightGreyBg,
              child: Icon(Icons.person, color: Colors.grey, size: 20),
            ),
          ),
        ],
      ),
      // Isi Menu-nya
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<String>(
          value: 'profile',
          child: Text("My Profile", style: TextStyle(color: AppTheme.darkText, fontWeight: FontWeight.w500)),
        ),
        const PopupMenuItem<String>(
          value: 'admin',
          child: Text("Admin Panel", style: TextStyle(color: AppTheme.darkText, fontWeight: FontWeight.w500)),
        ),
        const PopupMenuDivider(), // Garis pembatas tipis
        const PopupMenuItem<String>(
          value: 'logout',
          child: Text("Sign Out", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        ),
      ],
      // Logika kalau menunya diklik
      onSelected: (String value) {
        if (value == 'profile') {
          print("Pergi ke Profile"); // Nanti ganti dengan Navigator
        } else if (value == 'admin') {
          print("Pergi ke Admin Panel");
        } else if (value == 'logout') {
          print("Proses Logout");
        }
      },
    );
  }
}