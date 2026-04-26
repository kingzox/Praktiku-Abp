import 'package:flutter/material.dart';
import '../theme/app_theme.dart'; // 1. Import gudang tema kita
import '../pages/browse_event_page.dart';
import '../pages/login_page.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
          const SizedBox(height: 20),

          // Judul Utama Baris 1
          const Text(
            "Discover Campus Events at",
            textAlign: TextAlign.center,
            style: AppTheme.titleLarge, // 2. Pakai gaya dari pusat
          ),

          // Judul Utama Baris 2 (Gradasi)
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                AppTheme.primaryPink, // 3. Panggil warna dari pusat
                AppTheme.gradientOrange,
              ],
            ).createShader(bounds),
            child: const Text(
              "Telkom University Purwokerto",
              textAlign: TextAlign.center,
              style: AppTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 16),

          // Deskripsi
          const Text(
            "Stay connected with seminars, workshops, and gatherings organized by student associations and lecturers.",
            textAlign: TextAlign.center,
            style: AppTheme.subtitleRegular, // 4. Pakai gaya dari pusat
          ),
          const SizedBox(height: 30),

          // Tombol-tombol
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BrowseEventPage()),
                  );
                },
                style: AppTheme.primaryButton, // 5. Tombol jadi simpel banget kodenya
                child: const Text("Browse Events", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 12),
              
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: AppTheme.outlineButton, // 6. Pakai style outline dari pusat
                child: const Text("Submit Event", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}