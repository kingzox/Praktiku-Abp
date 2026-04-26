import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../kerangka/registrasi_kerangka.dart'; // <-- JANGAN LUPA IMPORT INI!

class RegistrationDetailsPage extends StatelessWidget {
  const RegistrationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // --- 1.HEADER NAVIGASI ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, size: 16, color: AppTheme.darkBlue),
                    label: const Text("Back", style: TextStyle(color: AppTheme.darkBlue, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              
              // Garis pembatas atas
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(color: AppTheme.dividerColor, height: 1),
              ),

              // --- 2. KARTU PUTIH UTAMA (Cuma Panggil Kerangka!) ---
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // PAKAI MODUL KERANGKA DISINI
                    RegistrasiKerangka.eventTitle("Annual Tech Symposium", "Seminar", "LECTURER"),
                    const SizedBox(height: 30),
                    RegistrasiKerangka.organizerBox("Telkom IoT Lab", "EVENT HOLDER"),
                    const SizedBox(height: 30),
                    RegistrasiKerangka.scheduleBox("03 Apr 2026", "04:14 AM", "30 Apr 2026", "04:14 AM"),
                    const SizedBox(height: 30),
                    RegistrasiKerangka.infoRow(Icons.location_on, "LOCATION", "Gedung IoT Lantai 3"),
                    const SizedBox(height: 20),
                    RegistrasiKerangka.infoRow(Icons.link, "REGISTRATION LINK", "http://univent.com", isLink: true),
                    const SizedBox(height: 20),
                    RegistrasiKerangka.infoRow(Icons.phone, "CONTACT PERSON", "+62 8123 4567 89"),
                    const SizedBox(height: 30),
                    
                    // Deskripsi (bisa internal gapapa karena cuma teks panjang)
                    const Text("EVENT DESCRIPTION", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 0.5)),
                    const SizedBox(height: 12),
                    const Text(
                      "Join us for the most prestigious symposium of the year, focusing on IoT and AI innovations... (teks deskripsi panjang masuk di sini).",
                      style: TextStyle(fontSize: 14, color: AppTheme.greyText, height: 1.5),
                    ),
                    const SizedBox(height: 30),
                    
                    // --- 3. TOMBOL AKSI UTAMA ---
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: AppTheme.primaryButton,
                        child: const Text("REGISTER NOW", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100), // Spasi biar gak mentok bottom nav
            ],
          ),
        ),
      ),
    );
  }
}