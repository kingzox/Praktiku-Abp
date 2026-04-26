import 'package:flutter/material.dart';
import '../theme/app_theme.dart'; 

class UpcomingEventsSection extends StatelessWidget {
  const UpcomingEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.backgroundLight, // <--- 2. Background pakai tema
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Seksi & Tombol See All
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Upcoming Events",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkText, // <--- 3. Teks gelap
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(50, 30),
                ),
                child: const Text(
                  "See All",
                  style: TextStyle(
                    color: AppTheme.primaryPink, // <--- 4. Warna pink Univent
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Card "Null State" (Belum ada event)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: AppTheme.white, // <--- 5. Warna putih
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryPink.withOpacity(0.1), // 6. Pink transparan otomatis senada
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.event_busy,
                    size: 35,
                    color: AppTheme.primaryPink, // <--- 7. Icon pink
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Belum ada event",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkText, // <--- 8. Teks gelap
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Yuk, jadi yang pertama membuat event seru di kampus!",
                  textAlign: TextAlign.center,
                  style: AppTheme.subtitleRegular, //
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}