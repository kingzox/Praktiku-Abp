import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../kerangka/history_kerangka.dart'; // <-- Panggil kerangkanya
import 'registration_details_page.dart';

class EventHistoryPage extends StatelessWidget {
  const EventHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundLight,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.darkText),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Event History", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic, color: Color(0xFF0F172A), letterSpacing: -0.5)),
            const SizedBox(height: 8),
            const Text("Pantau status pendaftaran dan daftar event yang pernah kamu ikuti.", style: TextStyle(fontSize: 14, color: AppTheme.greyText, height: 1.5)),
            const SizedBox(height: 32),

            // TINGGAL PANGGIL KERANGKA, MASUKIN DATA, BERES!
            HistoryKerangka.historyCard(
              context,
              title: "as", 
              date: "25 APR 2026", 
              location: "212", 
              status: "PENDING", 
              statusColor: const Color(0xFFFDE68A),
              statusTextColor: const Color(0xFFD97706),
              onDetailsPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationDetailsPage()));
              },
            ),
            
            HistoryKerangka.historyCard(
              context,
              title: "Annual Tech Symposium 2024", 
              date: "10 MAY 2026", 
              location: "Main Auditorium", 
              status: "APPROVED", 
              statusColor: const Color(0xFFD1FAE5),
              statusTextColor: const Color(0xFF059669),
              onDetailsPressed: () {
                 // Navigasi ke detail event yang ini
              },
            ),
          ],
        ),
      ),
    );
  }
}