import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../kerangka/edit_profile_kerangka.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // --- TOMBOL BACK ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, size: 16, color: AppTheme.darkText),
                    label: const Text("Back", style: TextStyle(color: AppTheme.darkText, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // --- KARTU UTAMA ---
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30.0), // Padding disesuaikan untuk HP
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(30), 
                  boxShadow: [
                    BoxShadow(color: AppTheme.glowPink.withAlpha(80), blurRadius: 80, spreadRadius: 0, offset: const Offset(0, 0)),
                    BoxShadow(color: Colors.black.withAlpha(5), blurRadius: 30, offset: const Offset(0, 10)),
                  ],
                ),
                // 👇 INI YANG DIUBAH JADI COLUMN (ATAS-BAWAH) 👇
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // --- BAGIAN ATAS: FOTO PROFIL ---
                    EditProfileKerangka.editPhotoSection("Admin Univent"),
                    const SizedBox(height: 40),

                    // --- BAGIAN BAWAH: FORMULIR ---
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EditProfileKerangka.editHeader(),
                        const SizedBox(height: 30),
                        
                        EditProfileKerangka.editInputField(
                          label: "FULL NAME", 
                          prefixIcon: Icons.person, 
                          hint: "Admin Univent",
                        ),
                        const SizedBox(height: 20),

                        EditProfileKerangka.editInputField(
                          label: "BIRTHDAY", 
                          prefixIcon: Icons.cake_outlined, 
                          hint: "mm/dd/yyyy", 
                          suffixIcon: Icons.calendar_month,
                        ),
                        const SizedBox(height: 20),

                        EditProfileKerangka.editInputField(
                          label: "PHONE NUMBER", 
                          prefixIcon: Icons.phone_outlined, 
                          hint: "08123456789",
                        ),
                        const SizedBox(height: 40),

                        // --- TOMBOL AKSI ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center, // Ditengahin biar aman di HP
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(context), // Sekalian dikasih fungsi Cancel
                              child: const Text("Cancel", style: TextStyle(color: AppTheme.greyText, fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton(
                              onPressed: () {},
                              style: AppTheme.primaryButton,
                              child: const Text("SAVE CHANGES", style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}