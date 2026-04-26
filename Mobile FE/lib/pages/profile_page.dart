import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../kerangka/profile_kerangka.dart'; 
import 'event_history_page.dart'; 
import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // Taruh di pojok kanan
              children: [
                ProfileKerangka.topDropdownMenu(context),
              ],
            ),
            const SizedBox(height: 24),
            // --- BAGIAN 1: KARTU FOTO PROFIL & STATISTIK ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.circular(30), 
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20, offset: const Offset(0, 10))],
              ),
              // KITA PAKAI STACK BIAR MENUNYA BISA MELAYANG DI POJOK
              child: Stack(
                children: [
                  // --- MENU DROPDOWN DI POJOK KANAN ATAS ---
                  Align(
                    alignment: Alignment.topRight,
                    child: ProfileKerangka.cardDropdownMenu(context),
                  ),

                  // --- ISI KARTU UTAMA (FOTO, NAMA, STATS) ---
                  Column(
                    children: [
                      Container(
                        width: 100, height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppTheme.lightGreyBg,
                          border: Border.all(color: Colors.grey.shade200, width: 2),
                          boxShadow: [BoxShadow(color: AppTheme.primaryPink.withOpacity(0.15), blurRadius: 20, spreadRadius: 5)],
                        ),
                        child: const Icon(Icons.person_outline, size: 50, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      
                      const Text("Admin Univent", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.darkText)),
                      const SizedBox(height: 4),
                      const Text("STUDENT", style: TextStyle(color: AppTheme.primaryPink, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 12)),
                      const SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProfileKerangka.statBox("0", "EVENTS"),
                          const SizedBox(width: 16),
                          ProfileKerangka.statBox("0", "HISTORY"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24), 

            // --- BAGIAN 2: KARTU INFORMASI PERSONAL ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.circular(30), 
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20, offset: const Offset(0, 10))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileKerangka.sectionTitle("Personal Information"),
                  const SizedBox(height: 24),
                  
                  // TINGGAL PANGGIL KERANGKA INFO ROW
                  ProfileKerangka.infoRow(icon: Icons.email_outlined, iconColor: AppTheme.primaryPink, bgColor: AppTheme.lightPinkBg, label: "EMAIL ADDRESS", value: "univenttelkom@gmail.com"),
                  ProfileKerangka.divider(),
                  
                  ProfileKerangka.infoRow(icon: Icons.calendar_today_outlined, iconColor: AppTheme.white, bgColor: AppTheme.primaryPink, label: "BIRTHDAY", value: "Not set yet"),
                  ProfileKerangka.divider(),
                  
                  ProfileKerangka.infoRow(icon: Icons.phone_outlined, iconColor: AppTheme.greyText, bgColor: AppTheme.lightGreyBg, label: "PHONE NUMBER", value: "Not set yet"),
                  
                  const SizedBox(height: 30),

                  // --- BAGIAN TOMBOL AKSI ---
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // KODE NAVIGASI 
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const EditProfilePage())
                        );
                      },
                      style: AppTheme.primaryButton,
                      child: const Text("Edit Profile", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ProfileKerangka.outlineButton(
                        icon: Icons.history_outlined, 
                        label: "Event History", 
                        color: AppTheme.darkText, 
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const EventHistoryPage()));
                        }
                      ),
                      const SizedBox(width: 12),
                      ProfileKerangka.outlineButton(
                        icon: Icons.logout_outlined, 
                        label: "Log Out", 
                        color: AppTheme.primaryPink, 
                        onPressed: () {}
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}