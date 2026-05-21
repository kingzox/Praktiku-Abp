import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../kerangka/edit_profile_kerangka.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 40.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),

                  // --- PANGGIL DARI KERANGKA ---
                  EditProfileKerangka.profilePicture(),
                  const SizedBox(height: 40),

                  // --- PANGGIL DARI KERANGKA ---
                  EditProfileKerangka.formHeader(),
                  const SizedBox(height: 32),

                  // --- INPUT FIELDS PANGGIL DARI KERANGKA ---
                  EditProfileKerangka.inputField(
                    label: "FULL NAME",
                    hint: "Admin Univent",
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(height: 20),

                  EditProfileKerangka.inputField(
                    label: "BIRTHDAY",
                    hint: "mm/dd/yyyy",
                    icon: Icons.cake_outlined,
                    suffixIcon: Icons.calendar_today_outlined,
                  ),
                  const SizedBox(height: 20),

                  EditProfileKerangka.inputField(
                    label: "PHONE NUMBER",
                    hint: "08xxxxxx",
                    icon: Icons.phone_outlined,
                  ),
                  const SizedBox(height: 40),

                  // --- TOMBOL CANCEL & SAVE ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primaryPink.withOpacity(0.4),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Logika untuk save changes dan kembali ke profil
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryPink,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            "SAVE CHANGES",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),

            // --- TOMBOL BACK DI KIRI ATAS ---
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: AppTheme.darkBlue),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
