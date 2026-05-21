import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../pages/event_detail_page.dart'; // Import halaman detail

class HomeKerangka {
  static Widget univentLogo() {
    return const Text("Univent", style: TextStyle(color: AppTheme.darkBlue, fontWeight: FontWeight.w900, fontSize: 20));
  }

  static Widget statItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: AppTheme.primaryPink, size: 28),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.darkBlue)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: AppTheme.greyText)),
      ],
    );
  }

  static Widget sectionTitle(String title, {bool showSeeAll = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.darkBlue)),
        if (showSeeAll)
          const Text("See All >", style: TextStyle(color: AppTheme.primaryPink, fontWeight: FontWeight.bold, fontSize: 14)),
      ],
    );
  }

  // 👇 UPDATE: Sekarang minta 'context' agar tombolnya tahu jalan ke halaman detail
  static Widget eventCard({
    required BuildContext context, 
    required String title, 
    required String organizer, 
    required String date, 
    required String location,
    bool isRecommended = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 140,
                width: double.infinity,
                decoration: const BoxDecoration(color: AppTheme.darkBlue, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: Text("> npm run dev [ERROR] Failed to load resource...", style: TextStyle(color: Colors.white24, fontSize: 10))),
                ),
              ),
              if (isRecommended)
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: AppTheme.primaryPink, borderRadius: BorderRadius.circular(8)),
                    child: const Text("REKOMENDASI", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.darkBlue)),
                const SizedBox(height: 4),
                Text(organizer, style: const TextStyle(color: Colors.redAccent, fontSize: 12, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text(date, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text(location, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    // 👇 ACTION DI SINI SEKARANG AKTIF! 👇
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EventDetailPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.darkBlue,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("View Details", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget categoryButton({required String label, required IconData icon, required Color bgColor, required Color fgColor}) {
    return Container(
      width: 105,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Icon(icon, color: fgColor, size: 28),
          const SizedBox(height: 8),
          Text(label, style: TextStyle(color: fgColor, fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }
}